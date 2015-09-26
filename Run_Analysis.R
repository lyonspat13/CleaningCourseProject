getwd()
setwd("/Users/patricklyons/Documents/RWork")

library(dplyr)
library(plyr)

## Start reading in all the necessary text files as data frames##
Xtest <- read.table("X_test.txt", sep = "", header = FALSE, dec=".")
Ytest <- read.table("y_test.txt", sep = "", header = FALSE, dec=".")
Xtrain <- read.table("X_train.txt", sep = "", header = FALSE, dec=".")
Ytrain <- read.table("y_train.txt", sep = "", header = FALSE, dec=".")
Subjecttest <- read.table("subject_test.txt", sep = "", header = FALSE, dec=".")
Subjecttrain <- read.table("subject_train.txt", sep = "", header = FALSE, dec=".")
Features <- read.table("Features.txt", sep = "", header = FALSE, dec=".")
Activitylabels <- read.table("activity_labels.txt", sep = "", header = FALSE, dec=".")
## end reading in all the necessary text files as data frames

## 'merge' the test and train data first by essentially appending all train rows to test rows
XTotal <- rbind(Xtest, Xtrain)
YTotal <- rbind(Ytest,Ytrain) 
SubjectTotal <- rbind(Subjecttest,Subjecttrain)

## add colnames to the three resulting frames before Y and Subject to X
colnames(XTotal) <- Features$V2
colnames(YTotal) <- "Feature_Code"
colnames(SubjectTotal) <- "Subject_Code"

## add feature name to the YTotal data frame ##
YTotal$Feature_Name <- Activitylabels$V2[ match(YTotal$Feature_Code,Activitylabels$V1)]

## merge data frames together ##
XYSubject <- cbind(SubjectTotal,YTotal,XTotal)

## manipulate features data frame to find 'mean' and 'std' and creates droplist ##
Features$IsMean_STD <- grepl(paste(c("mean","std"),collapse="|"), Features$V2)
droplist <- Features$V2[Features$IsMean_STD =="FALSE"]

##drop columns from XYSubject that do not contain 'mean' or 'std' ##
XYSubject <- XYSubject [, !names(XYSubject) %in% droplist]

## create another data set with averages of all the remaining metrics by activity and subject ##

XYSubjectAverage <- ddply (XYSubject, .(Subject_Code,Feature_Name), numcolwise(mean)) 

write.table(XYSubjectAverage, "XYSubjectAverage.txt", row.names = FALSE)