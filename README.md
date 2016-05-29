# getting-and-cleaning-data-project
 
## Synopsis
 
 A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
 
  The run_analysis.R that does the following.
* Retrieves the data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Motivation

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.   Output from this assignment (a tidy data set) will be used in later coursework. 

## How to create the tidy data set
1. clone this repository  
2. open a R console and set the working directory to the repository root (use setwd())
3. source run_analisys.R script (it requires the plyr package): `source('run_analysis.R')` 
4. After completion, you will find the file `tidydata.txt` in the repository root directory
