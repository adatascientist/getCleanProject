---
title: "README.MD"
output: html_document
---
### About the run_analysis.R Script

The run_analysis.R script can be run in its entirety from your working directory to download course project zip file, unzip UCI HAR Dataset file folder and files, merge train and test data, extract mean and std variables, apply descriptive activity and feature variable names, aggregate the data to obtain average for feature data grouped by activity and subject, and create and write an independent tidy data set to tdataset.txt.  The script also saves merged train and test data set as dataset.txt and std mean data set as stdmean.txt.

### Preparing to Run the run_analysis.R Script

__Set Working Directory__  

Before running the script, start by setting working directory and verify that you are in the working directory.  For example:
```
setwd("c:/users/yourName/documents/work");getwd()
``` 

### Running the run_analysis.R Script  

After you have set the working directory, the entire script can be selected and run.  It will run all the way through to creating the tidy data set, tdataset.txt, and printing a sample of the data to the console.  Along the way the script will also create two intermediate files, dataset.txt and stdmean.txt.  

### How the run_analysis.R Script Works  
The following sections describe what the code in run_analysis.R does.  

__Download Data Set Folders and Data Files to Working Directory__  

The following code will download course project zip file, unzip and save UCI HAR Dataset folder containing related files to the working directory.  
```
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"  
temp<-tempfile()  
download.file(fileURL,temp,mode="wb")  
unzip(temp,exdir=".")  
unlink(temp)
```   

Document the date and time of download in "dateDownloaded".  
```
dateDownloaded<-Sys.time()
```

__Collect Activity and Feature Data from Train and Test Data__    
The following code will create data frames with actiivity and feature data collected from the train and test data sets.  
```
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt") ## activity from train  
xtrain<-read.table("./UCI HAR Dataset/train/x_train.txt")  ## feature data from train  
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt") ## activity from test  
xtest<-read.table("./UCI HAR Dataset/test/x_test.txt")  ## feature data from test  
```

__Collect Subject Numbers__    
The following code will create data frame with subject numbers from the train and test data sets.  
```
subtrain<-read.table("./UCI HAR Dataset/train/subject_train.txt") ## subject in train group   
subtest<-read.table("./UCI HAR Dataset/test/subject_test.txt") ## subject in test group  
names(subtrain)<-"subject"  ## name the subject variable  
names(subtest)<-"subject"  ## name the subject variable  
```  

__Collect Descriptive Variable Names for Feature Data__    
The descriptive variable names from features.txt will be used as column names for the feature data in a later step.  
```
variables<-read.table("./UCI HAR Dataset/features.txt")  ## name the feature variable  
```  

__Add Group Variable to Label Train and Test__    

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

__Apply Descriptive Names to the Activities in the Data Set__      
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

__Label the Data Sets with Descriptive Variable Names from features.txt__    
The following code uses the descriptions from features.txt as variable names for the feature data.  For more information of these variable name, please see the CODEBOOK.MD file.  
```
xtr<-xtrain  
colnames<-variables[,2]  
colnames(xtr)<-colnames  ## use descriptive variable names for train   feature data  
xte<-xtest  
colnames(xte)<-colnames  ## use descriptive variable names for test feature data  
```

__Combine Group, Subect, Activity and Feature Set Data__    
The following code will combine group, subject, and activity variables with feature set data.  
```
trainset<-cbind(ntrain,subtrain,actytrain,xtr)  ## combine group, subject, activity, x_train  
testset<-cbind(ntest,subtest,actytest,xte)  ## combine group, subject, activity, x_test 
```  

__Merge the Training and Test Dat Set to Create One Data Set__      
The following code will combine train and test data to create a data frame named dataset.  This data frame will be written to the working directory as dataset.txt.  The file will be read into a data frame named checkset.      
```
dataset<-rbind(trainset,testset)  ## combined training and test set    
write.table(dataset,file="./dataset.txt",row.names=FALSE)  ## save combined train and test data file   
checkset<-read.table("./dataset.txt",header=TRUE)  ## read saved merged data file    
```  

__Extract the Mean and Standard Deviation Measurements for each Measurement__    
The following code searches for feature set variable names that contain either "std" or "mean" and creates an index.  The index will be used to select only those variable columns for a new data frame, ds1.    
```
ds<-dataset  ## assign dataset to ds  
std<-grep("std",as.character(colnames(ds)))  ## identify variable columns containing "std"  
mean<-grep("mean",as.character(colnames(ds))) ## identify variable columns containing "mean"  
stdmean<-c(std,mean)  ## create combined integer vector with std or mean variable column numbers  
stdmean<-sort(stdmean)  ## sort vector to create variable column index    
ds1<-(ds[,c(1:3,stdmean)])  ## create first dataset using group, subject, activity, std-mean column index  
```  

__Verify Resulting Data Set is Tidy__    
The following code verifies that there is only one column for each variable and only one row for each observation.  
```
which(duplicated(names(ds1)))  ## check for duplicated variable names  
which(duplicated(ds1))  ## check for duplicated rows  
```  

__Write Data File Containing "std" and "mean" Variable Names to Working Directory__    
The following code writes the stdmean.txt file to the working directory.  
```
write.table(ds1,file="./stdmean.txt",row.names=FALSE)  ## save std and mean only data file  
checkstdmean<-read.table("./stdmean.txt",header=TRUE)  ## read std and mean only data file  
```  

__Create Second, Independent Tidy Data Set with Average of Each Measurement Variable Grouped by Activity and Subject__    
The following code removes the group variable (train and test) which is not needed for the final tidy data set and creates a new data frame g.  It then aggregates the measurement data in g by activity and subject and takes the mean.  It then checks for NA's and writes the tidy data set to tdataset.txt.  It reads the data set into the dataframe tdataset and then checks a sample from the data frame.      
```
g<-ds1[,2:82]  ## removing group variable (train, test) - not needed for aggregation step  

## aggregate by activity and subject to compute mean for feature variables   
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
