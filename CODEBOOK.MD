---
title: "CODEBOOK"
output: html_document
---

## Codebook Overview  

The data for the course project, Human Activity Recognition Using Smartphones Data Set, was obtained from the UC Irvine Machine Learning Repository.  This codebook describes the data that was provided through a data download, what the variables mean, and highlights some key steps taken through the run_analysis.R script to transform and clean up the data to produce a tidy data set. For complete details on how the run_analysis.R script is used and how each step in of script works, please see the README.MD file.  

### About the UCI HAR Dataset  

The UCI HAR Dataset was downloaded to a temporary file as a zip file.  The zip file was unzipped and the UCI HAR Dataset file folder placed in working directory.  

The UCI HAR Dataset file folder contains the following files:  
- activity_labels.txt  
- features.txt  
- features_info.txt  
- README.txt  
- It also contains two subfolders, train and test.    

The train subfolder contains the following files:  
  - subject_train.txt  
  - X_train.txt  
  - Y_train.txt  
  - Inertial Signals subfolder  
  
The test subfolder contains the following files:  
  - subject_test.txt  
  - X_test.txt  
  - Y_test.txt  
  - Inertial Signals subfolder   

__The following information was taken from the README.txt file provided with the UCI HAR Dataset.  It explains how the data was obtained and the meaning of the data contained in the files.__      

==================================================================  
Human Activity Recognition Using Smartphones Dataset  
Version 1.0  
==================================================================  
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  
==================================================================    

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

__For Each Record it is Provided:__  

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

__Description of the Dataset Files__    

- 'features_info.txt': Shows information about the variables used on the feature vector.  

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.   

__Notes__  
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws  

__License__  
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

### Variables Used for the Feature Data  
__The information below is taken from the features_info.txt file.__    

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are:   

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

The complete list of variables of each feature vector is available in 'features.txt'  

### Variables Used in the Tidy Data Set  
- subject:  the subject number for each of the thirty subjects that participated in the data collection process.  
- activity: the descriptive activity variable corresponding to WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.  
- feature variables:  only those feature variables containing "mean" or "std" in their variable names were included in the dataset that was aggregated by activity and subject to create the tidy dataset.  

### Key Data Transformation and Clean Up Steps  
The following describes the key steps taken by the run_analysis.R script to transform and clean up the original data provided into the tidy dataset.  For complete details of each step taken by the run_analysis.R script, see the README.MD file.  

__Collect Subject, Activity, and Feature Data__  
As explained above, the UCI HAR Dataset is provided in files ("building blocks") that must be combined to produce the desired dataset.  Both the train and test data are structured the same way in that they contain separate files with subject, activity, and feature data.  The first step is to collect the required data into data frames so that it can be transformed and combined as required.    

The following code will create data frames with actiivity and feature data collected from the train and test data sets.  
```
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt") ## activity from train  
xtrain<-read.table("./UCI HAR Dataset/train/x_train.txt")  ## feature data from train  
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt") ## activity from test  
xtest<-read.table("./UCI HAR Dataset/test/x_test.txt")  ## feature data from test  
```
  
The following code will create data frame with subject numbers from the train and test data sets.  
```
subtrain<-read.table("./UCI HAR Dataset/train/subject_train.txt") ## subject in train group   
subtest<-read.table("./UCI HAR Dataset/test/subject_test.txt") ## subject in test group  
names(subtrain)<-"subject"  ## name the subject variable  
names(subtest)<-"subject"  ## name the subject variable  
```  

The descriptive variable names from features.txt will be used as column names for the feature data in a later step.  
```
variables<-read.table("./UCI HAR Dataset/features.txt")  ## name the feature variable  
```  
The following creates a data frame with the group variables train and test.  While not required, this provides a means to separate the data in the combined data set.    
```
rowsxtrain<-as.integer(nrow(xtrain))  ## rows in x_train  
ntrain<-data.frame()  ## create variable to identify train data  
for(i in 1:rowsxtrain){  
    ntrain[i,c(1)]<-as.factor("train")    
}  
names(ntrain)<-c("group")  ## create variable group name for train data  
rowsxtest<-as.integer(nrow(xtest))  ## rows in x_test  
ntest<-data.frame()  ## create variable to identify test data  
for(i in 1:rowsxtest){  
    ntest[i,c(1)]<-as.factor("test")  
}  
names(ntest)<-c("group")  ## create variable group name for test data
```

__Replace Numeric Activity Variables with Descriptive Variables__      
The following code will replace the numeric activity variables with descriptive activity names.  
```
actytrain<-data.frame()  ## use descriptive name to replace train activity variables  
rowsytrain<-as.integer(nrow(ytrain))  
for (i in 1:rowsytrain){  
    if(ytrain[i,]==1){actytrain[i,1]<-"WALKING"}  
    if(ytrain[i,]==2){actytrain[i,1]<-"WALKING_UPSTAIRS"}  
    if(ytrain[i,]==3){actytrain[i,1]<-"WALKING_DOWNSTAIRS"}  
    if(ytrain[i,]==4){actytrain[i,1]<-"SITTING"}  
    if(ytrain[i,]==5){actytrain[i,1]<-"STANDING"}  
    if(ytrain[i,]==6){actytrain[i,1]<-"LAYING"}  
}  
names(actytrain)<-"activity"  ## create variable group name for activity variable    
actytest<-data.frame()   ## use descriptive name to replace test activity variables  
rowsytest<-as.integer(nrow(ytest))  
for (i in 1:rowsytest){  
    if(ytest[i,]==1){actytest[i,1]<-"WALKING"}  
    if(ytest[i,]==2){actytest[i,1]<-"WALKING_UPSTAIRS"}  
    if(ytest[i,]==3){actytest[i,1]<-"WALKING_DOWNSTAIRS"}  
    if(ytest[i,]==4){actytest[i,1]<-"SITTING"}  
    if(ytest[i,]==5){actytest[i,1]<-"STANDING"}  
    if(ytest[i,]==6){actytest[i,1]<-"LAYING"}  
}  
names(actytest)<-"activity" 
``` 
__Apply Descriptive Variable Names to Feature Data__   
The following code uses the descriptions from features.txt as variable names for the feature data.    
```
xtr<-xtrain  
colnames<-variables[,2]  
colnames(xtr)<-colnames  ## use descriptive variable names for train   feature data  
xte<-xtest  
colnames(xte)<-colnames  ## use descriptive variable names for test feature data  
```
__Combine Subject, Activity and Feature Data Then Train and Test Data__   
The following code will combine group, subject, and activity variables with feature set data.  
```
trainset<-cbind(ntrain,subtrain,actytrain,xtr)  ## combine group, subject, activity, x_train  
testset<-cbind(ntest,subtest,actytest,xte)  ## combine group, subject, activity, x_test 
```  
   
The following code will combine train and test data to create a data frame named dataset.  This data frame will be written to the working directory as dataset.txt.  The file will be read into a data frame named checkset.      
```
dataset<-rbind(trainset,testset)  ## combined training and test set    
write.table(dataset,file="./dataset.txt",row.names=FALSE)  ## save combined train and test data file   
checkset<-read.table("./dataset.txt",header=TRUE)  ## read saved merged data file    
```  
__Extract Std and Mean Feature Data__   
The following code searches for feature set variable names that contain either "std" or "mean" and creates an index.  The index will be used to select only those variable columns for a new data frame, ds1.    
```
ds<-dataset  ## assign dataset to ds  
std<-grep("std",as.character(colnames(ds)))  ## identify variable columns containing "std"  
mean<-grep("mean",as.character(colnames(ds))) ## identify variable columns containing "mean"  
stdmean<-c(std,mean)  ## create combined integer vector with std or mean variable column numbers  
stdmean<-sort(stdmean)  ## sort vector to create variable column index    
ds1<-(ds[,c(1:3,stdmean)])  ## create first dataset using group, subject, activity, std-mean column index  
```  

__Verify Dataset is Tidy - Check for Duplicate Columns and Rows__  
The following code verifies that there is only one column for each variable and only one row for each observation.  
```
which(duplicated(names(ds1)))  ## check for duplicated variable names  
which(duplicated(ds1))  ## check for duplicated rows  
```  

__Aggregate by Activity and Subject and Obtain Mean of Feature Data, Write Tidy Data Set__  
The following code removes the group variable (train and test) which is not needed for the final tidy data set and creates a new data frame g.  It then aggregates the measurement data in g by activity and subject and takes the mean.  It then checks for NA's and writes the tidy data set to tdataset.txt.  It reads the data set into the dataframe tdataset and then checks a sample from the data frame.      
```
g<-ds1[,2:82]  ## removing group variable (train, test) - not needed for aggregation step

ag<-aggregate(g[,c(3:81)], by=list(subject=as.factor(g$subject),activity=g$activity),FUN=mean,na.rm=TRUE)  

which(is.na(ag))  ## check for NAs  

agcolnames<-names(ag[,c(1:81)]) ## show aggregated feature column names as means
cols<-length(agcolnames)
for (i in 3:cols){
    agcolnames[i]<-paste0("mean",agcolnames[i])
}
colnames(ag)<-as.factor(agcolnames)

## take aggregated data frame and write to a text file  
write.table(ag, file="./tdataset.txt",row.names=FALSE) 

## read the text file back into R and verify file matches originating file  
tdataset<-read.table("./tdataset.txt",header=TRUE)  
head(tdataset)  ## check that tidy dataset appears correct  
```
