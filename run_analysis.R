#  

#website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
#
#    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
#Here are the data for the project:
#     
# Datasource:    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
#You should create one R script called run_analysis.R that does the following.
#
#   Function 
#      1.  Merges the training and the test sets to create one data set.
#      2.  Extracts only the measurements on the mean and standard deviation for each measurement.
#      3.  Uses descriptive activity names to name the activities in the data set
#      4. Appropriately labels the data set with descriptive variable names.
#      5.  From the data set in step 4, creates a second, independent
#         tidy data set with the average of each variable for each 
#      activity and each subject.

require(plyr)
#     Download and unzip source data
if(!file.exists(".data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/zipfile.zip")

unzip("./data/zipfile.zip", overwrite = TRUE, exdir = "./data")

 

#   Merges the training and the test sets to create one data set.
#    
#   File path to dataset
dfpath <- file.path("./data", "UCI HAR Dataset")
#  Activty data
activityTest <- read.table(file.path(dfpath, "test", "y_test.txt"))
activityTrain <- read.table(file.path(dfpath, "train", "y_train.txt"))
activity <- rbind(activityTrain, activityTest)

#  Subject data
subjectTrain <- read.table(file.path(dfpath, "train", "subject_train.txt"),header = FALSE)
subjectTest  <- read.table(file.path(dfpath, "test" , "subject_test.txt"),header = FALSE)
subject <- rbind(subjectTrain, subjectTest)
#  Feature data
featuresTest  <- read.table(file.path(dfpath, "test" , "X_test.txt" ),header = FALSE)
featuresTrain <- read.table(file.path(dfpath, "train", "X_train.txt"),header = FALSE)
featureNames <- read.table(file.path(dfpath, "features.txt"), header = FALSE)
features <- rbind(featuresTrain, featuresTest)


#  Set meaningful names to data
names(subject) <- c("subject")
names(activity) <- c("activityId")
names(features) <- featureNames$V2
 
# Merge
sub_act <-  cbind(subject, activity)
data <- cbind(features, sub_act)
 
#  Extracts only the measurements on the mean and standard deviation for each measurement.

relNames <- featureNames$V2[grep("mean|std", featureNames$V2)]
relCol <- c("subject", "activityId", as.character(relNames))

data <- subset(data, select = relCol)

#  Uses descriptive activity names to name the activities in the data set
activityNames <- read.table(file.path(dfpath, "activity_labels.txt"), header = FALSE, col.names = c("activityId", "activity"))
data <- join(data, activityNames, by = "activityId", match = "first")

#   Appropriately labels the data set with descriptive variable names.
names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Acceleration", names(data))
names(data)<-gsub("GyroJerk", "AngularAcceleration", names(data))
names(data)<-gsub("Gyro", "AngularSpeed", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
 
#Remove parentheses
names(data) <- gsub('\\(|\\)',"",names(data), perl = TRUE)
names(data) <- gsub("-","",names(data))
names(data) <- tolower(names(data))



#  From the data set in step 4, creates a second, independent
#         tidy data set with the average of each variable for each 
#      activity and each subject.
dataActSub = ddply(data, c("subject","activity"), numcolwise(mean))
write.table(dataActSub, file= "tidydata.txt", row.names = FALSE)

 

