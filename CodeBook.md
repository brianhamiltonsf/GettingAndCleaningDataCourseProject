run_analysis.R performs the following actions:

- Read features.txt to create a data frame called features  
- Read X_train.txt to create the train data frame, removing columns that do not include "mean()" or "std"    
- Read X_test.txt to create the test data frame, removing columns that do not include "mean()" or "std"    
- Create feature_names character vector of feature names and apply it to the test and train data sets. Remove "()" from the vector to clean up the names. Change leading "t" to "time-" since this t refers to measurements on the time domain. Change leading "f" to "freq-" since this f refers to measurements on the frequency domain.  
- Read in subject_train.txt to create the train_subjects data frame. Rename V1 column to SUBJECT_ID and add to train data frame.    
- Read in subject_test.txt to create the test_subjects data frame. Rename V1 column to SUBJECT_ID and add to test data frame. 
- Read in y_train.txt to create train_labels data frame. Rename V1 column to ACTIVITY and add to train data frame.  
- Read in y_test.txt to create test_labels data frame. Rename V1 column to ACTIVITY and add to test data frame.  
- Use rbind to combine train and test data frames to create combined data frame.
- Read in activity_labels.txt to create labels data frame.  
- Use labels data frame to determine the correct value for each ACTIVITY in the combined data frame.  
- Group combined data frame by SUBJECT_ID and ACTIVITY and summarize to find the mean for each variable per SUBJECT_ID and ACTIVITY.

The above commands produce the below variables:

SUBJECT_ID
Identifies the subject who was the source of the data. It consists of integer values ranging from 1 to 30

ACTIVITY
Identifies the activity performed by the subject when the data was recorded
There are six values:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

The following 66 numeric columns capture measurements made during the study by the phone's accelerometer and gyroscope. The measurements are between -1 and 1. 

Acc: measured by the phone's accelerometer, comprised of body and gravitational motion components  
Gyro: measured by the phone's gyroscope  
time: measured on the time domain  
freq: measured on the frequency domain  
mean: the mean of the measurement  
std: the standard deviation of the measurement  
X/Y/Z: these indicate the direction of the measurement    
Jerk: obtained via body linear acceleration and angular velocity  
Mag: the magnitude of the signal calclated using Euclidean norm  

time-BodyAcc-mean-X          
time-BodyAcc-mean-Y           
time-BodyAcc-mean-Z           
time-BodyAcc-std-X           
time-BodyAcc-std-Y            
time-BodyAcc-std-Z            
time-GravityAcc-mean-X       
time-GravityAcc-mean-Y        
time-GravityAcc-mean-Z        
time-GravityAcc-std-X        
time-GravityAcc-std-Y         
time-GravityAcc-std-Z         
time-BodyAccJerk-mean-X      
time-BodyAccJerk-mean-Y       
time-BodyAccJerk-mean-Z       
time-BodyAccJerk-std-X       
time-BodyAccJerk-std-Y        
time-BodyAccJerk-std-Z   
freq-BodyAcc-mean-X           
freq-BodyAcc-mean-Y           
freq-BodyAcc-mean-Z          
freq-BodyAcc-std-X            
freq-BodyAcc-std-Y            
freq-BodyAcc-std-Z           
freq-BodyAccJerk-mean-X        
freq-BodyAccJerk-mean-Y       
freq-BodyAccJerk-mean-Z      
freq-BodyAccJerk-std-X        
freq-BodyAccJerk-std-Y        
freq-BodyAccJerk-std-Z  
freq-BodyAccMag-mean          
freq-BodyAccMag-std           
freq-BodyBodyAccJerkMag-mean   
freq-BodyBodyAccJerkMag-std  
time-BodyGyro-mean-X         
time-BodyGyro-mean-Y          
time-BodyGyro-mean-Z          
time-BodyGyro-std-X          
time-BodyGyro-std-Y           
time-BodyGyro-std-Z           
time-BodyGyroJerk-mean-X     
time-BodyGyroJerk-mean-Y      
time-BodyGyroJerk-mean-Z      
time-BodyGyroJerk-std-X      
time-BodyGyroJerk-std-Y       
time-BodyGyroJerk-std-Z       
time-BodyAccMag-mean         
time-BodyAccMag-std             
time-GravityAccMag-mean       
time-GravityAccMag-std       
time-BodyAccJerkMag-mean      
time-BodyAccJerkMag-std       
time-BodyGyroMag-mean        
time-BodyGyroMag-std          
time-BodyGyroJerkMag-mean     
time-BodyGyroJerkMag-std     
freq-BodyGyro-mean-X          
freq-BodyGyro-mean-Y          
freq-BodyGyro-mean-Z         
freq-BodyGyro-std-X           
freq-BodyGyro-std-Y           
freq-BodyGyro-std-Z           
freq-BodyBodyGyroMag-mean     
freq-BodyBodyGyroMag-std     
freq-BodyBodyGyroJerkMag-mean  
freq-BodyBodyGyroJerkMag-std  
