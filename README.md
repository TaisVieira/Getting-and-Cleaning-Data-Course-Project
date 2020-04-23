# Getting-and-Cleaning-Data-Course-Project

The data used in this project was collected from the accelerometers from the Samsung Galaxy S smartphone (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
From the original data, the files used for analysis were the following:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Binding the Training and Test sets to their respective labels and subjects and then to each other, the data set allData was created.

Using allData was possible to create tidyData, a data set that contains the average of each variable for each activity and each subject.
