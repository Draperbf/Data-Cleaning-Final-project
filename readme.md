Information about the scripts in this project

run_analysis.R:
  run_analysis downloads the source data set form the internet
  Extracts the Zip file into "UCI HAR Dataset" directory
    this directory contains:
      Activity Labels which is a look up for the activity labels
      Features which describes the x test and train files
      Test directory contains the test data
      train directory contains the training data
      
  1) Loads all the dataset files into Tables
  Merges Test and Training datasets into single datasets
    all_data,all_labels and all_subjects
  
  2) Finds and extracts only those columns in all_Data that contain Mean or STD in their columns names
  3) converts the activity data to associated activity name
  4) Combines the data, activity labels and subject data into one dataset.  Change the column names to their correct names
  5) Creates a final dataset of the mean of each column by Activity and subject
   
  