## run_analysis.R - creates a tidy dataset from the Human Activity Recognition 
## Using Smartphones Dataset.
##
## It merges multiple datasets from this experiment to obtain the mean of
## all the mean & standard deviation columns in the raw data files grouping by 
## volunteer (subject_id) & activity (activity_desc).
##
## Refer to README.md file for detailed explanation of the code below.
## Refer to features_info.txt for information regarding data.
##
## V1 - 09/18/2015. Mai Nguyen. Initial Version.


#Read data files
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

activity <- read.table("activity_labels.txt")
features <- read.table("features.txt")


#Merge data 
x_data <- rbind(x_test, x_train)
y_data <- rbind(y_test, y_train)
subject_data <- rbind(subject_test, subject_train)


#Rename columns 
colnames(x_data) <- as.character(features[,2]) 


#Add Subject Id & Activity Id column to data
x_data$Subject_Id  <- subject_data[,1]
x_data$Activity_Id <- y_data[,1]


#Join to get activity description
library(plyr)
colnames(activity) <- c("Activity_Id", "Activity_Desc")
x_data <- arrange(join(x_data, activity), Activity_Id)


#Keep only columns required: Subject Id, Activity Description, mean & std columns
keep_column <- c( ncol(x_data)-2 #Subject Id
                 ,ncol(x_data)   #Activity Desc
                 ,grep("mean",colnames(x_data))
                 ,grep("std" ,colnames(x_data)))

data_correct_cols <- subset(x_data, select=keep_column)


#Summarise data by Subject_Id & Activity_Desc
library(dplyr)
tidy_data <- data_correct_cols %>% group_by(Subject_Id, Activity_Desc) %>% summarise_each(funs(mean))

#Write data file
write.table(tidy_data, file="smartphone_act_tidydata.txt", row.name=FALSE)
