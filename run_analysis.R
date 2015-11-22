# R script called run_analysis.R that does the following:
# 1) Merge the Training and the Test sets to create one data set
# 2) Extract only the measurements on the Mean and Standard Deviation for each measurement
# 3) Use descriptive activity names to name the activities in the data set
# 4) Appropriately label the data set with descriptive variable names
# 5) From dataset in 4) create an independent tidy dataset with the average of each variable for each activity and each subject
# Set the working directory where the data sets have been downloaded to
# Load package plyr to help with segmenting data later eg ddply
# Read the training related data
# Read the testing related data
# Merge training and test sets together - Step 1
# Name the subject data column
# Read the activity label names
# Update numeric YData with correct textual activity names
# Name the activity YData column - Step 3
# Read the Features data file
# Extract the column indicies which contain mean() and std() data - Step 2
# Take the interested subset of columns from XData
# Extract the feature names for columns we are interested in
# Tidy the feature names
# Name the feature columns using tidied feature names - Step 4
# Combine the columns of feature data with the activity column and subject column
# For each activity and subject combination calcluate the average of each feature variable - Step 5
# Write the features average for each activity and subject to a file
