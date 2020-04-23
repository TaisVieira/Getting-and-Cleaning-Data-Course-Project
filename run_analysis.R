library(dplyr)
library(reshape2)

#download and unzip files
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "smsng.zip")
unzip("smsng.zip", exdir="Samsung")

#get names of variables and activities labels
variables<-read.table("Samsung/UCI HAR Dataset/features.txt")
variables<-variables[,2]
activitiesLabels<-read.table("Samsung/UCI HAR Dataset/activity_labels.txt")
activitiesLabels<-activitiesLabels[,2]
activitiesLabels<-tolower(activitiesLabels)

#read test, labels and subjects tables, name columns, subset desired columns (mean and standard deviation) and merge all three
train<-read.table("Samsung/UCI HAR Dataset/train/X_train.txt")
trainLabel<-read.table("Samsung/UCI HAR Dataset/train/y_train.txt")
trainSubject<-read.table("Samsung/UCI HAR Dataset/train/subject_train.txt")
colnames(train)<-variables
train<-train[,grep(".*mean.*|.*std.*", colnames(train))]
train<-cbind(trainSubject, trainLabel, train)

#read test, labels and subjects tables, name columns, subset desired columns (mean and standard deviation) and merge all three
test<-read.table("Samsung/UCI HAR Dataset/test/X_test.txt")
testLabel<-read.table("Samsung/UCI HAR Dataset/test/y_test.txt")
testSubject<-read.table("Samsung/UCI HAR Dataset/test/subject_test.txt")
colnames(test)<-variables
test<-test[,grep(".*mean.*|.*std.*", colnames(test))]
test<-cbind(testSubject, testLabel, test)

#merge test and train sets and name first and second columns
allData<-rbind(train, test)
colnames(allData)[1]<-"Subject"
colnames(allData)[2]<-"Activity"

#add descriptive activity name
allData$Activity<-factor(allData$Activity, levels=1:6, labels=activitiesLabels)

#create tidy data set with the average of each variable for each activity and each subject
allData.melt<-melt(allData, id=c("Subject", "Activity"))
tidyData<-dcast(allData.melt, Subject + Activity ~ variable, mean)

write.table(tidyData, "tidyData.txt", row.names = FALSE, quote = FALSE)
