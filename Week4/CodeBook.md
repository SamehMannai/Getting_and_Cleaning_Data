# Code Book
generated 2017-06-05 14:40:18 during sourcing of `run_analysis.R`

This is a code book that describes the variables, the data, and any transformations or work performed to clean up the data.

## Actions performed on data:
* create data dir `./Project`
* downloading zip file: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to `./Project`
* extracting zip file: `./Project/Dataset.zip` to `./Project/UCI HAR Dataset`
* merging all *_test.txt and *_train.txt files into one dataset: `all_data`
* subsetted `all_data` into `MeanAndStd_data` based on  `logic_mean_std` keeping only the desired columns containing `std` or `mean`
* Merged the `MeanAndStd_data` set with the `acitivityType` table to include the names of the descriptive activity  into `MeanAndStdAndActivityNames_data`
* Appropriately  labels the data set with descriptive variable names
* Ceates  a second, independent tidy data set **`TidyDataSet`** with the average of each variable for each activity and each subject
* write `TidyDataSet` to file  `TidyDataSet.txt`

## `TidyDataSet` variable

Variable name       | Description  
--------------------|--------------------------
`activityID`     | Label of activity, Factor w/ 6 levels
`subjectID`           | ID of subject, int (1-30)

**Variable name **

`timeBodyAccelerometer-mean()-X`    
`timeBodyAccelerometer-mean()-Y`    
`timeBodyAccelerometer-mean()-Z`    
`timeBodyAccelerometer-std()-X`    
`timeBodyAccelerometer-std()-Y`    
`timeBodyAccelerometer-std()-Z`    
`timeGravityAccelerometer-mean()-X`    
`timeGravityAccelerometer-mean()-Y`    
`timeGravityAccelerometer-mean()-Z`    
`timeGravityAccelerometer-std()-X`    
`timeGravityAccelerometer-std()-Y`    
`timeGravityAccelerometer-std()-Z`    
`timeBodyAccelerometerJerk-mean()-X`    
`timeBodyAccelerometerJerk-mean()-Y`    
`timeBodyAccelerometerJerk-mean()-Z`    
`timeBodyAccelerometerJerk-std()-X`    
`timeBodyAccelerometerJerk-std()-Y`    
`timeBodyAccelerometerJerk-std()-Z`    
`timeBodyGyroscope-mean()-X`    
`timeBodyGyroscope-mean()-Y`    
`timeBodyGyroscope-mean()-Z`    
`timeBodyGyroscope-std()-X`    
`timeBodyGyroscope-std()-Y`    
`timeBodyGyroscope-std()-Z`    
`timeBodyGyroscopeJerk-mean()-X`    
`timeBodyGyroscopeJerk-mean()-Y`    
`timeBodyGyroscopeJerk-mean()-Z`    
`timeBodyGyroscopeJerk-std()-X`    
`timeBodyGyroscopeJerk-std()-Y`    
`timeBodyGyroscopeJerk-std()-Z`    
`timeBodyAccelerometerMagnitude-mean()`    
`timeBodyAccelerometerMagnitude-std()`    
`timeGravityAccelerometerMagnitude-mean()`    
`timeGravityAccelerometerMagnitude-std()`    
`timeBodyAccelerometerJerkMagnitude-mean()`    
`timeBodyAccelerometerJerkMagnitude-std()`    
`timeBodyGyroscopeMagnitude-mean()`    
`timeBodyGyroscopeMagnitude-std()`    
`timeBodyGyroscopeJerkMagnitude-mean()`    
`timeBodyGyroscopeJerkMagnitude-std()`    
`frequencyBodyAccelerometer-mean()-X`    
`frequencyBodyAccelerometer-mean()-Y`    
`frequencyBodyAccelerometer-mean()-Z`    
`frequencyBodyAccelerometer-std()-X`    
`frequencyBodyAccelerometer-std()-Y`    
`frequencyBodyAccelerometer-std()-Z`    
`frequencyBodyAccelerometer-meanFreq()-X`    
`frequencyBodyAccelerometer-meanFreq()-Y`    
`frequencyBodyAccelerometer-meanFreq()-Z`    
`frequencyBodyAccelerometerJerk-mean()-X`    
`frequencyBodyAccelerometerJerk-mean()-Y`    
`frequencyBodyAccelerometerJerk-mean()-Z`    
`frequencyBodyAccelerometerJerk-std()-X`    
`frequencyBodyAccelerometerJerk-std()-Y`    
`frequencyBodyAccelerometerJerk-std()-Z`    
`frequencyBodyAccelerometerJerk-meanFreq()-X`    
`frequencyBodyAccelerometerJerk-meanFreq()-Y`    
`frequencyBodyAccelerometerJerk-meanFreq()-Z`    
`frequencyBodyGyroscope-mean()-X`    
`frequencyBodyGyroscope-mean()-Y`    
`frequencyBodyGyroscope-mean()-Z`    
`frequencyBodyGyroscope-std()-X`    
`frequencyBodyGyroscope-std()-Y`    
`frequencyBodyGyroscope-std()-Z`    
`frequencyBodyGyroscope-meanFreq()-X`    
`frequencyBodyGyroscope-meanFreq()-Y`    

 **Activity Labels**

`WALKING` (value 1),
`WALKING_UPSTAIRS` (value 2),
`WALKING_DOWNSTAIRS` (value 3),
`SITTING` (value 4),
`STANDING` (value 5),
`LAYING` (value 6)
