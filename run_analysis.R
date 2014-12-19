## run_analysis.R script can be run in its entirety 
## from your working directory to download course project zip file, 
## unzip UCI HAR Dataset,merge train and test data, extract mean 
## and std variables, apply descriptive activity and feature variable names,
## aggregate feature data to obtain mean grouped by activity and subject,
## and create and write an independent tidy data set to tdataset.txt.
## Script also saves merged train and test data set as dataset.txt
## and std mean data set as stdmean.txt.

## start by setting working directory and verifying
## for example, setwd("c:/users/yourName/documents/work")
## getwd()

## Download data set folders and data to working directory

## download zip file, unzip and save UCI HAR Dataset folder to working directory
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp<-tempfile()
download.file(fileURL,temp,mode="wb")
unzip(temp,exdir=".")
unlink(temp)

## Document date and time of download in "dateDownloaded"
dateDownloaded<-Sys.time()

ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt") ## activity from train
xtrain<-read.table("./UCI HAR Dataset/train/x_train.txt")  ## feature data from train

ytest<-read.table("./UCI HAR Dataset/test/y_test.txt") ## activity from test
xtest<-read.table("./UCI HAR Dataset/test/x_test.txt")  ## feature data from test

subtrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")  ## subject in train group
subtest<-read.table("./UCI HAR Dataset/test/subject_test.txt") ## subject in test group

names(subtrain)<-"subject"  ## name the subject variable
names(subtest)<-"subject"  ## name the subject variable

variables<-read.table("./UCI HAR Dataset/features.txt")  ## name the feature variables

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

##  Apply descriptive names to the activities in the data set
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

##  Label the data sets with descriptive variable names from feature.txt 
xtr<-xtrain
colnames<-variables[,2]
colnames(xtr)<-colnames  ## use descriptive variable names for train feature data

xte<-xtest
colnames(xte)<-colnames  ## use descriptive variable names for test feature data

trainset<-cbind(ntrain,subtrain,actytrain,xtr)  ## combine group, subject, activity, x_train

testset<-cbind(ntest,subtest,actytest,xte)  ## combine group, subject, activity, x_test

##  Merge the training set and test set to create one data set
dataset<-rbind(trainset,testset)  ## combined training and test set

write.table(dataset,file="./dataset.txt",row.names=FALSE)  ## save combined train and test data file
checkset<-read.table("./dataset.txt",header=TRUE)  ## read saved merged data file

ds<-dataset

##  Extract the mean and standard deviation measurements for each measurement
std<-grep("std",as.character(colnames(ds)))  ## identify variable columns containing "std"
mean<-grep("mean",as.character(colnames(ds))) ## identify variable columns containing "mean"

stdmean<-c(std,mean)  ## create combined integer vector with std or mean variable column numbers 
stdmean<-sort(stdmean)  ## sort vector to create variable column index

ds1<-(ds[,c(1:3,stdmean)])  ## create first dataset using group, subject, activity, std-mean column index

which(duplicated(names(ds1)))  ## check for duplicated variable names
which(duplicated(ds1))  ## check for duplicated rows

write.table(ds1,file="./stdmean.txt",row.names=FALSE)  ## save std and mean only data file
checkstdmean<-read.table("./stdmean.txt",header=TRUE)  ## read std and mean only data file

g<-ds1[,2:82]  ## removing group variable (train, test) - not needed for aggregation step

##  Create a second, independent tidy data set with average of each variable
##  for each activity and each subject

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

