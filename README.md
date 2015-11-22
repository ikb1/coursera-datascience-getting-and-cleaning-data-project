# Getting and Cleaning Data: Course Project

## Introduction
This Repository contains the following 4 files for the course project for the Coursera course "Getting and Cleaning data":
* README.md - This text file
* CodeBook.md - Test file describing variables, data and any transformations needed in cleaning the data
* run_analysis.R - Script that performs the data reading, cleaning and transformation
* TidyData.txt - The output data file produced by run_analysis.R

## Source Data
The data worked on in this project task was collected from accelerometers from the Samsung Galaxy S smartphone
The data is known as the Human Activity Recognition Using Smartphones Dataset
Obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Script and Tidy dataset
We are supplied seperate test and training data sets for a large number of features, activity data and subject data
We are asked to produce an R script called run_analysis.R that does the following:
 1) Merge the Training and the Test sets to create one data set
 2) Extract only the measurements on the Mean and Standard Deviation for each measurement
 3) Use descriptive activity names to name the activities in the data set
 4) Appropriately label the data set with descriptive variable names
 5) From dataset in 4) create an independent tidy dataset with the average of each variable for each activity and each subject

## Code Book
This text file explains the transformations carried out and the tidy data output file and variables
