library(dplyr)
library(data.table)

#Read in the names of the features and create a vector for mean and standard deviation features 
features <- read.table("../data/UCI_HAR_Dataset/features.txt") 
mean_std <- grep("mean\\(\\)|std", features$V2)

#Read in the training and test data sets, selecting only the columns that are mean or standard deviation features
train <- fread("../data/UCI_HAR_Dataset/train/X_train.txt", select = mean_std)
test <- fread("../data/UCI_HAR_Dataset/test/X_test.txt", select = mean_std)

#Change the column names to feature names
feature_names <- features$V2
feature_names <- as.data.frame(feature_names)
feature_names <- rename(feature_names, feature = feature_names)
feature_names$feature <- as.character(feature_names$feature)
feature_names <- filter(feature_names, grepl("mean\\(\\)|std", feature))
feature_names <- gsub("\\(|\\)", "", feature_names$feature)
feature_names <- gsub("^t", "time-", feature_names)
feature_names <- gsub("^f", "freq-", feature_names)
colnames(train) <- feature_names
colnames(test) <- feature_names

#Read in the subjects for the training and test data sets
train_subjects <- read.table("../data/UCI_HAR_Dataset/train/subject_train.txt")
test_subjects <- read.table("../data/UCI_HAR_Dataset/test/subject_test.txt")

#Rename the columns to SUBJECT_ID
train_subjects <- rename(train_subjects, SUBJECT_ID = V1)
test_subjects <- rename(test_subjects, SUBJECT_ID = V1)

#Merge the training and test sets with their SUBJECT_ID's
train <- cbind(train, train_subjects)
test <- cbind(test, test_subjects)

#Read in the labels for the training and test data sets
train_labels <- read.table("../data/UCI_HAR_Dataset/train/y_train.txt")
test_labels <- read.table("../data/UCI_HAR_Dataset/test/y_test.txt")

#Rename the columns to ACTIVITY
train_labels <- rename(train_labels, ACTIVITY = V1)
test_labels <- rename(test_labels, ACTIVITY = V1)

#Merge the training and test sets with their ACTIVITY labels
train <- cbind(train, train_labels)
test <- cbind(test, test_labels)

combined <- as.data.frame(rbind(train, test)) #Merge the training and test data sets
combined$ACTIVITY <- as.character(combined$ACTIVITY) #Convert ACTIVITY to character as we will replace the values with text
labels <- read.table("../data/UCI_HAR_Dataset/activity_labels.txt") #Read in activity labels

#Replace the numerical value in the ACTIVITY column with it's associated text value
for(row in 1:nrow(combined)){
  if(combined[row, "ACTIVITY"] %in% labels$V1){
    number <- combined[row, "ACTIVITY"]
    newActivity <- as.character(labels[labels$V1 == number,"V2"])
    combined[row, "ACTIVITY"] = newActivity
  }
}

#Group the combined data set by SUBJECT_ID and ACTIVITY and then find the mean of each variable per SUBJECT_ID and ACTIVITY
combined_grouped <- group_by(combined, SUBJECT_ID, ACTIVITY)
combined_summarized <- summarize_at(combined_grouped, c(1:66), mean)
combined_summarized <- as.data.frame(combined_summarized)


