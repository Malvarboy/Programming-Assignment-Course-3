# CodeBook contains the codes used in this propgramming assignment

The R script file is run_analysis.R and its final output is a tidy data that contains the average (means) of various metrics grouped subject and activities. Below are the steps:

### A. Load relevant libraries
1. Load dplyr library
2. Load tibble library

### B. Download the zip files
1. Assign the relevant url where the zip file is located to a variable
2. Download zip file using download.file()

### C. Read the various files and assign table to dataframes
* features dataframe is from features.txt file (561x2)
* activities dataframe is from activity_labels.txt file (6x2)
* x_test dataframe is from X_test.txt file (2947 x 561) 
* y_test dataframe is from Y_test.txt file (2947 x 561)
* subject_test is from subject_test.txt file (2947 x 1)
* x_train dataframe is from X_train.txt file (7352 x 561)
* y_train dataframe is from Y_train.txt file (7352 x 561)
* subject_train is from subject_train.txt file (7352 x 1)

### D. Combine all datasets
1. Using rbind, combine x_train and x_test
2. Using rbind, combine y_train and y_test
3. Using rbind, combine subject_train and subject_test
4. Using cbind, combine all datasets from 1-3 steps above resulting in all_data dataframe (10299 rows)

### E. Select columns with "mean" and "std"
* mean_std_data is created using all_data %>% select(). Select only columns with column names that contains the terms "mean" and "std"

### F. Add descriptive activity name
* add a column in mean_std_data based on the "code" column and the corresponding values of the code in the activities dataframe and name this "activity". Drop the "code" column.

### G. Give column names more descripting names
* using gsub, replace the following:
+ column names that starts with 't' replaced with 'Time'
+ column names that starts with 'f' replaced with 'Frequency'
+ column names that has 'Acc' repplaced with 'Accelerator'
+ column names that has 'Gyro' replaced with 'Gyroscope'
+ column names taht has 'Bodybody' replaced with 'Body'
+ column names that has 'Mag' replaced with 'Magnitude'
+ column names that has '-mean' replaced with 'Mean'
+ column names that has '-std' replaced with 'StDev'
+ column names that has ]'-freq' replaced with 'Frequency'
+ column names that has 'angle' replaced with 'Angle'
+ column names that has 'gravity' replaced with 'Gravity'

### H. Generate the final dataset
* using piping (mean_std_data %>% group_by %>% summarize), the final_data dataframe is generated from the mean_std_data dataframe
