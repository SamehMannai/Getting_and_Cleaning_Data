library( data.table )
library( reshape2 )
library(plyr);

## 1. Merges the training and the test sets to create one data set.

#Download the zip file containing the Samsung data and unzip it

if(!file.exists("./Project")){dir.create("./Project")}
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(Url,destfile="./Project/Dataset.zip")


# Unzip Dataset.zip to /Project directory
unzip(zipfile="./Project/Dataset.zip",exdir="./Project")
file.remove( "./Project/Dataset.zip" )

# List the files in the folder named UCI HAR Dataset.

pwd<- file.path("./Project", "UCI HAR Dataset")
list.files(pwd, recursive=TRUE)

## Reading files

# Reading trainings tables:

x_train <- read.table("./Project/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./Project/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./Project/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables:
x_test <- read.table("./Project/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./Project/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./Project/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table("./Project/UCI HAR Dataset/features.txt")

# Reading activity labels:
activityLabels = read.table("./Project/UCI HAR Dataset/activity_labels.txt")

# Assigning column names:

colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

# Merging test and train data to create one final data set:

data_train <- cbind(y_train, subject_train, x_train)
data_test <- cbind(y_test, subject_test, x_test)
all_data <- rbind(data_train, data_test)

## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

# Reading column names from all_data:
  
colNames <- colnames(all_data)

#  Create a logical vector for defining ID, mean and standard deviation:

logic_mean_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) )

# Subset all_data table based on  logic_mean_std to keep only the desired columns in MeanAndStd_data 
MeanAndStd_data <- all_data[ , logic_mean_std == TRUE]

## 3. Uses descriptive activity names to name the activities in the data set

# Merge the MeanAndStd_data set with the acitivityType table to include the names of the descriptive activity 
MeanAndStdAndActivityNames_data <- merge(MeanAndStd_data, activityLabels, by='activityId', all.x=TRUE)

##4.Appropriately labels the data set with descriptive variable names. 

names(MeanAndStdAndActivityNames_data)<-gsub("^t", "time", names(MeanAndStdAndActivityNames_data))
names(MeanAndStdAndActivityNames_data)<-gsub("^f", "frequency", names(MeanAndStdAndActivityNames_data))
names(MeanAndStdAndActivityNames_data)<-gsub("Acc", "Accelerometer", names(MeanAndStdAndActivityNames_data))
names(MeanAndStdAndActivityNames_data)<-gsub("Gyro", "Gyroscope", names(MeanAndStdAndActivityNames_data))
names(MeanAndStdAndActivityNames_data)<-gsub("Mag", "Magnitude", names(MeanAndStdAndActivityNames_data))
names(MeanAndStdAndActivityNames_data)<-gsub("BodyBody", "Body", names(MeanAndStdAndActivityNames_data))

## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Making second tidy data set

TidyDataSet <- aggregate(. ~subjectId + activityId, MeanAndStdAndActivityNames_data, mean)
TidyDataSet <- TidyDataSet[order(TidyDataSet$subjectId, TidyDataSet$activityId),]

# Writing second tidy data set in txt file

write.table(TidyDataSet, "TidyDataSet.txt", row.name=FALSE)

###########
codebook <- function(...){
  cat(..., "\n",file=targetCodebookFilePath,append=TRUE, sep="")
}


Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipDir <- "UCI HAR Dataset"
targetZipFile <- "Dataset.zip"
targetResultFile <- "TidyDataSet.txt"
dataPath <- "./Project"
targetZipFilePath <- file.path(dataPath,targetZipFile)
targetResultFilePath <- file.path(dataPath,targetResultFile)
extractedZipPath <- file.path(dataPath, zipDir)

#codebook
targetCodebookFilePath <- "./CodeBook.md"
file.remove(targetCodebookFilePath)
codebook("# Code Book")
codebook("generated ",as.character(Sys.time())," during sourcing of `run_analysis.R`")
codebook("") 
codebook("This is a code book that describes the variables, the data, and any transformations or work performed to clean up the data.")
codebook("")

codebook("## Actions performed on data:")

# create path
codebook("* create data dir `",dataPath,"`")
if(!file.exists(dataPath)){
  log("create path: `",dataPath,"`")
  dir.create(dataPath)
}
#################################
codebook("* downloading zip file: [",Url,"](",Url,") to `",dataPath,"`")

codebook("* extracting zip file: `",targetZipFilePath,"` to `",extractedZipPath,"`")

codebook("* merging all *_test.txt and *_train.txt files into one dataset: `all_data`")

codebook("* subsetted `all_data` into `MeanAndStd_data` based on  `logic_mean_std` keeping only the desired columns containing `std` or `mean`")

codebook("* Merged the `MeanAndStd_data` set with the `acitivityType` table to include the names of the descriptive activity  into `MeanAndStdAndActivityNames_data`")

codebook("* Appropriately  labels the data set with descriptive variable names")

codebook("* Ceates  a second, independent tidy data set **`TidyDataSet`** with the average of each variable for each activity and each subject")

codebook("* write `TidyDataSet` to file  `TidyDataSet.txt`")

codebook("") 
codebook("## `TidyDataSet` variable\n")

codebook("Variable name       | Description  ")
codebook("--------------------|--------------------------")
codebook("`activityID`     | Label of activity, Factor w/ 6 levels")
codebook("`subjectID`           | ID of subject, int (1-30)")
codebook("") 

codebook("**Variable name **")
codebook("")
TidyDataSetCols <- names(TidyDataSet)[3:68]
for(tdc in TidyDataSetCols){
  codebook("`",tdc,"`    ")
}

codebook("") 

codebook(" **Activity Labels**")
codebook("")
codebook("`WALKING` (value 1),")
codebook("`WALKING_UPSTAIRS` (value 2),")
codebook("`WALKING_DOWNSTAIRS` (value 3),")
codebook("`SITTING` (value 4),")
codebook("`STANDING` (value 5),")
codebook("`LAYING` (value 6)")

