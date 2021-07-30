# Programming-Assignment-Course-3
Repository for John Hopkins Data Science Course 3 (Getting and Cleaning Data) Programming Assignment

The objective of the programming assignment is to create a tidy data set from various datasets.

The dataset that is cleaned and summarized are the files from UCI Machine Learning Repository titles "Human Activity Recognition Using Smartphones Data Set". The link is below.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  


Description of the attributes of the data could be found in this link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


The repository contains the following:

* CodeBook.md describes the steps and the commands used in the r script

* run_analysis.R performs the following (and described further in CodeBook.md)
+ downloads the data
+ reads and loads into R (as a dataframe) to various txt files
+ combines the relevant dataframes
+ selects only columns that contains "mean" and "std"
+ clean the column names and update with more descriptive names / labels
+ create a final tidy dataset that groups and summarizes (average or mean) the data based on subject and activity

*  txt file containing the final tidy dataset (unformated text file)


