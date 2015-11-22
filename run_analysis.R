# R script called run_analysis.R that does the following:
# 1) Merge the Training and the Test sets to create one data set
# 2) Extract only the measurements on the Mean and Standard Deviation for each measurement
# 3) Use descriptive activity names to name the activities in the data set
# 4) Appropriately label the data set with descriptive variable names
# 5) From dataset in 4) create an independent tidy dataset with the average of each variable for each activity and each subject

# Set the working directory where the data sets have been downloaded to 
setwd("D:/course3/PROJECT")

# Load package plyr to help with segmenting data later eg ddply
library(plyr)

# Read the training related data
XTrain <- read.csv("./train/X_train.txt", sep="", header=FALSE)
YTrain <- read.csv("./train/y_train.txt", sep="", header=FALSE)
TrainSubject <- read.csv("./train/subject_train.txt", sep="", header=FALSE)

# Read the testing related data
XTest <- read.csv("./test/X_test.txt", sep="", header=FALSE)
YTest <- read.csv("./test/y_test.txt", sep="", header=FALSE)
TestSubject <- read.csv("./test/subject_test.txt", sep="", header=FALSE)

# Merge training and test sets together - Step 1
XData <- rbind(XTrain, XTest)
YData <- rbind(YTrain, YTest)
SubjectData <- rbind(TrainSubject, TestSubject)

# Name the subject data column
names(SubjectData) <- "Subject"

# Read the activity label names
Activity <- read.table("activity_labels.txt")

# Update numeric YData with correct textual activity names
YData[,1] <- Activity[YData[,1],2]

# Name the activity YData column - Step 3
names(YData) <- "Activity"

# Read the Features data file
F <- read.table("features.txt")

# Extract the column indicies which contain mean() and std() data - Step 2
Ci <- grep("mean\\(\\)|std\\(\\)",F[,2])

# Take the interested subset of columns from XData
XSubset <- XData[,Ci]

# Extract the feature names for columns we are interested in
F <- F[Ci,2]

# Tidy the feature names
F <- gsub("mean","Mean",F)
F <- gsub("std","StdDev",F)
F <- gsub("[-()]","",F)
F <- gsub("^t", "Time", F)
F <- gsub("^f", "Freq", F)
F <- gsub("BodyBody", "Body", F)

# Name the feature columns using tidied feature names - Step 4
names(XSubset) <- F

# Combine the columns of feature data with the activity column and subject column
Data <- cbind(XSubset,YData,SubjectData)

# For each activity and subject combination calcluate the average of each feature variable - Step 5
Tidy <- ddply(Data, c("Activity","Subject"), function(x) colMeans(x[,1:66]))

# Write the features average for each activity and subject to a file
write.table(Tidy,"AvgActSubData.txt", row.name=FALSE)
