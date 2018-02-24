In order to run this script you must be on a Mac or Linux-based machine. The R files are in a directory and the data files
are in a directory that is a peer of the R files directory. Set the working directory to the R files directory.

Two libraries are used for this project, dplyr and data.table. The first two lines load these libraries.

The features.txt file is first read into R. All columns that do not end in mean() or std are removed. This is because these 
are the columns that are required for the analysis. Both mean and std appear in the data with parentheses at the end but we 
only include them in the mean filter because the string mean also appears elsewhere in feature names and we want to exclude 
these from the list for analysis. The same logic is applied in the next step when the training and test data is read in via 
fread from the data.table package. 

At this point the test and training data sets have column names of V1, V2, etc. The next set of commands change the column
names to reflect the features they refer to. The features.txt file is referenced to make this change. The parentheses at 
the end of std() and mean() are removed. The t at the beginning feature names refers to time so t is changed to time-. The 
f at the beginning of feature names refers to frequency so f is changed to freq-.

The next step is to add the subject id's to the test and training data sets. The data is read into R and the column names 
are changed to SUBJECT_ID. The new columns are then added to the test and the training data sets. We now know the subject
for each measurement of each feature.

The next step is to add the activity name to the test and training data set. The data is read into R and the column names are 
changed to ACTIVITY. The columns contain numerical values that refer to activity names. The mapping is in the 
activity_labels.txt file. This file is read into R and used to change the numerical values in the ACTIVITY columns to their 
counterpart textual values. The ACTIVITY columns are then added to the test and training data sets. 

The final step is to determine the mean of each variable per SUBJECT_ID and ACTIVITY. The first step is to group the data by
SUBJECT_ID then by ACTIVITY. The mean of each column is then calculated to obtain the final result.

