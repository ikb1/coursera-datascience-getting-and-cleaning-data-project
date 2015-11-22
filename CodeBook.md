# CodeBook for the Tidy dataset

The original source data was recorded from experiments carried out with a group of 30 volunteers (Subjects) within an age bracket of 19-48 years. Each person performed six tasks WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING (Activities) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The measurements from the accelerometer and gyroscope 3-axial produced raw signals tAcc-XYZ and tGyro-XYZ. These being time domain signals having a prefix 't' to denote time.

They were then filtered using a median filter and further filter to remove noise.

Similarly, the acceleration signal was then separated into body and gravity acceleration signals tBodyAcc-XYZ and tGravityAcc-XYZ using another filter.

Then, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ. 

The magnitude of these three-dimensional signals were calculated using the Euclidean norm tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag.

Finally a Fast Fourier Transform was applied to some of the signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. Using the 'f' to indicate frequency domain signals.

The suffix -XYZ is use to denote the 3-axial signals in the X, Y and Z directions.

The purpose of the run_analysis.R script was to read in the test and train datasets containing these 561 feature measurements and combine them into a single dataset. Also to add the Subject and Activity label columns. In the process the dataset columns were renamed to give descriptive and meaningful titles as shown below.

Only the measurements relating to mean(): Mean value and std(): Standard deviation were to be selected.

The script was also asked to output an aggregated dataset where the average of each selected feature variable for each activity and each subject was to be calculated.

This produced a tidy data set containing 180 rows and 68 columns as below:

Column 1 contains "Activity" which is one of 6 following states relating to the type of activity that was being performed when the measurements relating to the subjects were being taken
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Column 2 specifies the "Subject" which is labelled with an ID from 1 to 30

Columns 3 to 68 contains the 66 averaged measurements

* TimeBodyAccMeanX
* TimeBodyAccMeanY
* TimeBodyAccMeanZ
* TimeBodyAccStdDevX
* TimeBodyAccStdDevY
* TimeBodyAccStdDevZ
* TimeGravityAccMeanX
* TimeGravityAccMeanY
* TimeGravityAccMeanZ
* TimeGravityAccStdDevX
* TimeGravityAccStdDevY
* TimeGravityAccStdDevZ
* TimeBodyAccJerkMeanX
* TimeBodyAccJerkMeanY
* TimeBodyAccJerkMeanZ
* TimeBodyAccJerkStdDevX
* TimeBodyAccJerkStdDevY
* TimeBodyAccJerkStdDevZ
* TimeBodyGyroMeanX
* TimeBodyGyroMeanY
* TimeBodyGyroMeanZ
* TimeBodyGyroStdDevX
* TimeBodyGyroStdDevY
* TimeBodyGyroStdDevZ
* TimeBodyGyroJerkMeanX
* TimeBodyGyroJerkMeanY
* TimeBodyGyroJerkMeanZ
* TimeBodyGyroJerkStdDevX
* TimeBodyGyroJerkStdDevY
* TimeBodyGyroJerkStdDevZ
* TimeBodyAccMagMean
* TimeBodyAccMagStdDev
* TimeGravityAccMagMean
* TimeGravityAccMagStdDev
* TimeBodyAccJerkMagMean
* TimeBodyAccJerkMagStdDev
* TimeBodyGyroMagMean
* TimeBodyGyroMagStdDev
* TimeBodyGyroJerkMagMean
* TimeBodyGyroJerkMagStdDev
* FreqBodyAccMeanX
* FreqBodyAccMeanY
* FreqBodyAccMeanZ
* FreqBodyAccStdDevX
* FreqBodyAccStdDevY
* FreqBodyAccStdDevZ
* FreqBodyAccJerkMeanX
* FreqBodyAccJerkMeanY
* FreqBodyAccJerkMeanZ
* FreqBodyAccJerkStdDevX
* FreqBodyAccJerkStdDevY
* FreqBodyAccJerkStdDevZ
* FreqBodyGyroMeanX
* FreqBodyGyroMeanY
* FreqBodyGyroMeanZ
* FreqBodyGyroStdDevX
* FreqBodyGyroStdDevY
* FreqBodyGyroStdDevZ
* FreqBodyAccMagMean
* FreqBodyAccMagStdDev
* FreqBodyAccJerkMagMean
* FreqBodyAccJerkMagStdDev
* FreqBodyGyroMagMean
* FreqBodyGyroMagStdDev
* FreqBodyGyroJerkMagMean
* FreqBodyGyroJerkMagStdDev
 
The run_analysis.R script made use of the package library(plyr) to help with segmenting data by using ddply.

The variables used in the run_analysis.R script were:

Feature data
------------
XTrain used to load X_train.txt data
XTest used to load X_test.txt data
XData used to combine data from XTrain and XTest

Activity data
-------------
YTrain used to load y_train.txt data
YTest used to load y_test.txt data
YData used to combine data from YTrain and YTest
Activity used to load activity_labels.txt data

Subject data
------------
TrainSubject used to load subject_train.txt data
TestSubject used to load subject_test.txt data
SubjectData used to combine data from TrainSubject, TestSubject

F used to load features.txt name data
Ci  column indicies for which feature columns contain mean() and std() data
XSubset reduced subset of XData containing feature columns containing mean() and std() data
Data single dataset containing XSubset + YData + SubjectData
Tidy summarised dataset containing for each activity and subject combination the average of each feature variable - This is the final dataset output from the script
