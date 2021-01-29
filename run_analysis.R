library(dplyr)

#get the dataset from the internet
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","dataset.zip") 
# unpack the dataset
unzip("dataset.zip")


#1 Merges the training and the test sets to create one data set.

# Read in Training Set
xtraining <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# read In Test Set
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest  <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# read in supporting files
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

# merge datasets
# merge X and Y train to merge labels to data
# Bind by rows test and train datasets
all_data <- rbind(xtraining,xtest)
all_labels <- rbind(ytrain,ytest)
all_subjects <- rbind(subjectTrain,subjecttest)



#2 Extracts only the measurements on the mean and standard deviation for each measurement. 

#look for Mean or STD in column names of features
found_col_nums =grep("mean|std",features[,2])
found_col_names = grep("mean|std",features[,2],value = TRUE)

#pull out only those columns that we found with Mean or STD
all_data = all_data %>% select(found_col_nums)


#3 Uses descriptive activity names to name the activities in the data set
# change the integer labels with text labels

#join the all_labels with ACtivites to get the names
all_labels <- all_labels %>%  inner_join(activities,by="V1")
all_labels <- all_labels %>% select("V2")

#4 Appropriately labels the data set with descriptive variable names. 
# bind all datasets by columns to make a total dataset
totalDataset <- cbind(all_data,all_labels,all_subjects)

# Change the column names to the names we found with Mean or STD add 2 columns for the activity and subject
names(totalDataset) =c(found_col_names,"Activity","Subject")

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

all_avg = totalDataset %>% group_by(Activity,Subject) %>% summarize_all(mean)

 