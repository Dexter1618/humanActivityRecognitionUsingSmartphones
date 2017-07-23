if(!("data.table" %in% installed.packages()))
# if the host doesn't have 'data.table' package installed, it will be installed
{
        message("'data.table' package is not installed. This script requires this package and so it will download it automatically")
        message()
        install.packages("data.table")
}

# 'data.table' package is required to run the commands in this script
library("data.table")








message(paste0("(Dowloading raw data at ",getwd()," [WORKING DIRECTORY])"))
message()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "./DATASET.zip",quiet = TRUE)
message("(Downloading complete)")
message()

unzip(zipfile = "./DATASET.zip")








activityLabels<-fread("UCI HAR Dataset/activity_labels.txt", col.names = c("activityID","activityName"))

variablesMeasured<-fread("UCI HAR Dataset/features.txt",col.names = c("variableID","variables"))

targetVariables_indices<-grep("(mean|std)\\(\\)",variablesMeasured[,variables])
targetVariables<-variablesMeasured[targetVariables_indices,variables]
targetVariables<-gsub("[()]","",targetVariables)








trainingData<-fread("UCI HAR Dataset/train/X_train.txt")
trainingData<-trainingData[,targetVariables_indices,with=FALSE]
setnames(trainingData,colnames(trainingData),targetVariables)

trainingActivity<-fread("UCI HAR Dataset/train/y_train.txt",col.names = "activityPerformed")
trainingSubject<-fread("UCI HAR Dataset/train/subject_train.txt",col.names = "subjectID")

trainingData<-cbind(trainingSubject,trainingActivity,trainingData)








testData<-fread("UCI HAR Dataset/test/X_test.txt")
testData<-testData[,targetVariables_indices,with=FALSE]
setnames(testData,colnames(testData),targetVariables)

testActivity<-fread("UCI HAR Dataset/test/y_test.txt",col.names = "activityPerformed")
testSubject<-fread("UCI HAR Dataset/test/subject_test.txt",col.names = "subjectID")

testData<-cbind(testSubject,testActivity,testData)








DATASET<-rbind(trainingData,testData)








# The column named "ACTIVITY PERFORMED (LABEL ID)" in the generated "DATASET" data table can be made
# into a factor column where each ID number correspons to a particular activity. 
# The information relating the ID and the activities are in the data table, "activityLabels" 
# as read from the file "activity_labels.txt"
DATASET$activityPerformed<-factor(DATASET$activityPerformed,levels = activityLabels$activityID,labels = activityLabels$activityName)

# Just like the "ACTIVITY PERFORMED (LABEL ID)" column, the column "SUBJECT ID" 
# can be made into a factor column where the values(levels) are in range 1 to 30 
# representing the 1st to the 30th subject in the experiment.
DATASET$subjectID<-as.factor(DATASET$subjectID)








# "melt" and "dcast" are used to create another data table
# which contains average values of each variable recorded for every kind
# of activity per subject.
# The data table generated is exported and written to disk at the working directory
# in a file named "AVERAGES.csv"
temp<-melt(DATASET,id=c("subjectID","activityPerformed"))
temp<-dcast(temp,subjectID+activityPerformed ~ variable,fun.aggregate = mean)
write.table(temp,file = "./AVERAGES.txt",row.names = FALSE)
message("The averages for every activity for every subject are calculated and exported as a text file in the working directory, named 'AVERAGES.txt'")








# intermediate script variables and data tables are removed
rm("activityLabels","variablesMeasured","targetVariables_indices","targetVariables","trainingData","trainingActivity","trainingSubject","testData","testActivity","testSubject","temp")