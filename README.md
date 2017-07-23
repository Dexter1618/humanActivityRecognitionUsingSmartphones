# Data Science Specialization, John Hopkins University
#
#
#### "Getting and Cleaning Data", Course 03

Week 04 Programmming Assignment
#
#
#
**Objectives completed by my R script**
1. Download the raw data from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
2. Extract it 
3. Merge the training and test data to form *one single dataset*. 
    * The dataset must contain *only the values of measurements of the mean and the standard deviation* for every recorded activity and for every subject.
    * The activity names must be the descriptive labels themselves, although it was recorded as specific numbers from 1 to 6 denoting the six activities.
    * The dataset must have descriptive variable column names.
4. Create another dataset which contains the average values for every measurement recorded for every activity and for every subject, and then export it as a file on disk.
#
#
#
**NOTE**: *The output data set is exported as a CSV file named '*outputDataset.csv*'to the working directory.
#
#
**Files from the raw data extract which are used to construct the dataframe**
* *UCI HAR Dataset/activity_labels.txt*
Contains the six activity labels along with their corresponding ID number from 1 to 6
* *UCI HAR Dataset/features.txt*
Contains names of all the variables that were recorded
* *UCI HAR Dataset/train/X_train.txt*
(TRAINING DATA) Contains values of all the variables that were recorded (in order of the names that were listed in *features.txt*.
* *UCI HAR Dataset/train/y_train.txt*
(TRAINING DATA) Contains the activities corresponding to set of every value for every variable recorded in *X_train.txt* and *features.txt* in their specified order.
* *UCI HAR Dataset/train/subject_train.txt*
(TRAINING DATA) Contains the subject ID numbers corresponding to single record as per *X_train.txt*,*y_train.txt* and *features.txt*.
* *UCI HAR Dataset/test/X_test.txt*
(TEST DATA) Similar to train/X_train.txt
* *UCI HAR Dataset/test/y_test.txt*
(TEST DATA) Similar to train/y_train.txt
* *UCI HAR Dataset/test/subject_test.txt*
(TEST DATA) Similar to train/subject_train.txt
