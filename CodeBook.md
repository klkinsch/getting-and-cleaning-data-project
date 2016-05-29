Code Book
========
### Source Data Description 
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

==================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
 
### Feature Selection 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

## Tidy Data Set
The set of variables found in the Tidy Data Set are: 

*  mean(): Mean value
*  std(): Standard deviation 

Notes: 
======
- No units of measure are provided because Features are normalized and bounded within [-1,1].

### Data Transformation with run_analysis.R
---------------------------------------
The raw data sets are processed with run_analisys.R script to create a tidy dataset

### Merge training and test sets
Test and training data are merged into a single data set
     X_train.txt
     X_test.txt
     subject_train.txt
     subject_test.txt
     y_train.txt
     y_test.txt
Variables labels are assigned per the original collector as noted in features.txt 

### Extract mean and standard deviation variables
Variables with labels that contain "mean" and "std" are extracted 

### Use descriptive activity names
A new column is added with the activity description - Activity id column is used to join labels from activity_labels.txt.

### Label variables appropriately
Labels given from the original collectors were changed:
* valid R names without parentheses or dashes 
* descriptive labels by exanding abbreviation

### Create a tidy data set
Numeric variables are averaged for each activity and each subject

The tidy data variables:
*  activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
*  subject: identifier of the subject who carried out the experiment  
*  a 79-feature time and frequency means
The following table represents the original data source feature names to the tidy data set variable names.  
"(mean-std)" denotes the measure and "XYZ" denotes three variables, one for each axis.

Original Data Set Feature Labels	     | Corresponding Tidy Data Feature Labels                       |   
------------------------------------- | ------------------------------------------------------------ | 
tBodyAcc-XYZ	                        | timebodyacceleration(mean-std)XYZ        |                           
tGravityAcc-XYZ	                    | timegravityaccelerationmean(mean-std)XYZ |
tBodyAccJerk-XYZ	                   | timebodyaccelerationjerk(mean-std)XYZ |
tBodyGyro-XYZ	                      | timebodyangularspeed(mean-std)XYZ |
tBodyGyroJerk-XYZ	                  | timebodyangularacceleration(mean-std)XYZ |
tBodyAccMag	                        | timebodyaccelerationmagnitude(mean-std)XYZ
tGravityAccMag	                     | timegravityaccelerationmagnitude(mean-std)XYZ
tBodyAccJerkMag	                    | timebodyaccelerationjerkmagnitude(mean-std)XYZ
tBodyGyroMag	                       | timebodyangularspeedmagnitude(mean-std)XYZ
tBodyGyroJerkMag	                   | timebodyangularspeedmagnitude(mean-std)XYZ
fBodyAcc-XYZ	                       | frequencybodyacceleration(mean-std)XYZ
fBodyAccJerk-XYZ	                   | frequencybodyaccelerationjerk(mean-std)XYZ
fBodyGyro-XYZ	                      | frequencybodyangularspeed(mean-std)XYZ
fBodyAccMag	                        | frequencybodyaccelerationmagnitude(mean-std)XYZ
fBodyAccJerkMag	                    | frequencybodyaccelerationjerk(mean-std)XYZ
fBodyGyroMag	                       | frequencybodyangularspeed(mean-std)XYZ
fBodyGyroJerkMag	                   | frequencybodyangularaccelerationmagnitude(mean-std)XYZ
 

Original Data License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The original dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

