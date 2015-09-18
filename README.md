# README for run_analysis.R

## Source Data
Download data zip file and save:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Extracting Source Data
Extract the following files from the zip file to R working directory. Interpretation of data from README.txt and features_info.txt

\UCI HAR Dataset\activity_label.txt - Activity Id and Activity Name/Description
\UCI HAR Dataset\features.txt - 

\UCI HAR Dataset\test\X_test.txt - data measurements for test data volunteers
\UCI HAR Dataset\test\y_test.txt - activity_ids corresponding to rows in X_test.txt file
\UCI HAR Dataset\test\subject_test.txt - subject_ids corresponding to rows in X_test.txt file

\UCI HAR Dataset\train\subject_train.txt - data measurements for training data volunteers
\UCI HAR Dataset\train\X_train.txt - activity_ids corresponding to rows in X_train.txt file
\UCI HAR Dataset\train\y_train.txt - subject_ids corresponding to rows in X_train.txt file

Datafiles in the Inertial Signals folder in both train and test were not extracted as they did not contain any mean or standard deviation data as required for this assignment.


## Description of run_analysis.R 
Run R script run_analysis.R to obtain tidy dataset.  Ensure working directory is set to the location where data files were extracted.

### Step 1
Load data files extracted as listed above.

### Step 2
Merge test and train data together for X, y & subject files. There are now 3 main datasets:
  * x_data - Measurements data
  * y_data - Activity Id 
  * subject_data - Subject Id 

### Step 3
Rename column names in measurements data (x_data) using the features data (features).

### Step 4
Add columns for Subject Id & Activity Id to measurements data.

### Step 5
Get Activity Description from activity data (activity).  This is done by first renaming columns in activity and then joining x_data to activity on Activity Id.

### Step 6
Keep only columns required for assignment: Subject Id, Activity Description, Mean & Standard Deviation columns.

### Step 7
Summarise data by Subject Id and Activity Description to get the mean of all the measurement columns.  This should result in one observation per Subject_Id & Activity combination.

### Step 8
Write final tidy data to file tidydata.txt to working directory.  This file can be loaded back into R for analysis or opened in Excel using space delimiter and text qualifier " (double quote).
 
