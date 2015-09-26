What follows is a Codebook ammended from the "features_info.txt" provided in the data set.  The particulars of the data set description have been changed to reflect the work done to the original data set, and relevant descriptions have been added.  Some explicit mention of units has been added since the original text file was not explicit.  This codebook aims primarliy to describe the variables and their calculation since the code file itself contains comments about what actions it performs.

Feature Selection (Edited to Include work done in Run_Analysis)

=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Subsequently, a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

t indicates that the primary unit is seconds
f indicates that the primary unit is just a count

for variables with "Acc" in the string the seconds are squared

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
meanFreq(): Weighted average of the frequency components to obtain a mean frequency


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

After the manipulations listed above, we took the average mean of the measurements by the following variables:

Subject_Code :  The integer identifier for a subject participating in the test
Feature_Name : The action being measured where the possibilities were walking, walking upstairs, walking downstairs, sitting, standing, laying

The following variable is also contained in the data set:

Feature_Code : This is a number that corresponds with a Feature_Name.  The relationship can be found by manipulating the data set.

All measurements in this data set are averages (mean) of the variables and variable combinations listed above.

The way to interpret the variable combinations would be like so (per the above):

tBodyAcc-mean()-X :  The mean of the mean body acceleration in the x direction for some subject for some activity type.
