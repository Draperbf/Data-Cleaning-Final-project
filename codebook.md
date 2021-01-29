Variables created:
  xtraining: x Training data contains 561 variables per row
  xtest: x test data containing 561 variables per row
  ytest: y test contains the labels for the test data
  ytrain: y train contains the labels for the training data
  activities: lookup tables of activities
  features: column definitions for the x train and test datasets
  subjecttest: subject identifier for the test data
  subjectTrain: subject indentifier for the train data

  all_data: merged datasets of xtrain and xtest
  all_labels: merged datases of ytrain and ytest
  all_subjects: merged dataset of subjecttest and subjectrain
  totalDataset: final dataset combining all_data,all_labels,all_subjects with filtered columns with Mean and STD with proper labels
  all_avg: Final dataset of mean values of totaldataset by subject and activity
  found_col_nums: column numbers of mean and std columns
  found_col_names:column names of mean and std columns