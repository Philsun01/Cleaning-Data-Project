Human Activity Recongition Codebook

The following is statistical information regarding human activity tracked through the motion sensor in their smartphones.

Experimental background:
Today's consumer are much more health conscious and like to validate their fitness activity through wearable or mobile devices.  The following data was gathered by the University of California Irvine department of machine learning through the accelerometers in Samsung Galaxy S Smartphones.  

Raw data: 
Statistical means and standard devationas for triaxial data (X,Y,Z) was provided for the following observations:
tBodyAcc - XYZ
tGravityAcc - XYZ
tBodyAccJerk - XYZ
tBodyGyro - XYZ
tBodyGyroJerk - XYZ
tBodyAcc Mag
tGravityAcc Mag
tBodyAccJerk Mag
tBodyGyro Mag
tBodyGyroJerk Mag
fBodyAcc  -XYZ
fBodyAccJerk - XYZ
fBodyGyro - XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Processed data: 
Data was provided in the form of a Training Data Set,Training Data Labels, Test Data Set, Test Data Label, Activity Labels, and Feature Labels.
1. All data files were loaded into R studio as dataframes.  
2. Dataset activity category numbers were merged with Activity Labels so activities can be read as descriptive words.
3. Column names were assigned to the Training and Test datasets through the Features Labels.
4. Training data labels were combined with Training data using cbind.
5. Test data labels were combined with Test data using cbind.
6. Training and Test data sets were then combined using the rbind.
7. Columns with the word "mean" or "std" were identified using grepl and extracted into a new table with along with the activity label column.
8. The mean/std table was then grouped by activity and the average(mean) of each column for each activity group was calculated.
9. The averaged mean/std table was then exported as a CSV file.