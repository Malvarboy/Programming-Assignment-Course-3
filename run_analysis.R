##COURSE 3: GETTING AND CLEANING DATA
##PROGRAMMING ASSIGNMENT
##PART OF JOHN HOPKINS DATA SCIENCE SPECIALIZATION




##########################################
# Load library
##########################################

library(dplyr)
library(tibble)



##########################################
# Load file and unzip file
##########################################

url_ <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url_, destfile = "course3_prog_assign.zip")
unzip("course3_prog_assign.zip")



##########################################
# Read the data and assign to dataframes
##########################################

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("recordNumber", "functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))



##########################################
# Tests data
##########################################

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features[["functions"]])
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", col.names = "code")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")



##########################################
# Train data
##########################################

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features[["functions"]])
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")



##########################################
#COMBINE TEST AND TRAIN DATASET
##########################################

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train,subject_test)
all_data <- cbind(subject_data, y_data, x_data)



##########################################
#EXTRACT ONLY DATA WITH "MEAN" AND "STD"
##########################################

mean_std_data <- all_data %>% select(subject, code, contains("mean"), contains("std"))



##########################################
#ADD DESCRIPTIVE ACTIVITY NAMES TO THE DATA
##########################################

mean_std_data <- add_column(mean_std_data, activity = activities[mean_std_data$code,2], .after = "code")
mean_std_data['code'] <- NULL



##########################################
#GIVE COLUMN NAMES DESCRIPTIVE NAMES
##########################################

names(mean_std_data) <- gsub("^t", "Time", names(mean_std_data))
names(mean_std_data) <- gsub("^f", "Frequency", names(mean_std_data))
names(mean_std_data) <- gsub("Acc", "Accelerometer", names(mean_std_data))
names(mean_std_data) <- gsub("Gyro", "Gyroscope", names(mean_std_data))
names(mean_std_data) <- gsub("BodyBody", "Body", names(mean_std_data))
names(mean_std_data) <- gsub("Mag", "Magnitude", names(mean_std_data))
names(mean_std_data) <- gsub("tBody", "TimeBody", names(mean_std_data))
names(mean_std_data) <- gsub("-mean()", "Mean", names(mean_std_data), ignore.case = TRUE)
names(mean_std_data) <- gsub("-std()", "StDev", names(mean_std_data), ignore.case = TRUE)
names(mean_std_data) <- gsub("-freq()", "Frequency", names(mean_std_data), ignore.case = TRUE)
names(mean_std_data) <- gsub("angle", "Angle", names(mean_std_data))
names(mean_std_data) <- gsub("gravity", "Gravity", names(mean_std_data))



##########################################
#CREATE FINAL TIDY DATA SET
##########################################

final_tidy_data <- mean_std_data %>% group_by(subject, activity) %>% summarize(across(everything(), mean))


##########################################
#WRITE TO A FILE THE FINAL DATA SET
##########################################

write.table(final_tidy_data, "FinalTidyData.txt", row.names = FALSE)
