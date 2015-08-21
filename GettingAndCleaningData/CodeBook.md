GACDCourseProject CODEBOOK
=================

Codebook for Course Project for Getting and Cleaning Data Course from Coursera by Paier Philipp

----------
## General ##
For each subject a variets of measurements have been measured during certain activities. Therefore an accelerometer and a gyroscope have been used, that delivered 3-axial raw signals (for the X, Y and Z axis). The exact description of all then derived features are explained in the features_info.txt file of the original dataset and is hereby quoted:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signals was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

However there are two major changes, that have been applied to the original dataset. While in the original dataset a variety of values were calculated for each signals, we only use the mean and standard deviation ones in the dataset at hand. The other major change, concerns itself with summarizing the data of one subject and activity. Originally each subject has been measured multiple times for each activity, resulting in a variety of measurements for one "subject-activity"-pair. I summarized the measurements by simply taking the average of each measurement variable over "subject-activity" pairs. Consequently the measurement variables differs from the original ones in various was:

- only mean and standard deviation measurements are taken (indicated by Mean or Std in the variable name)
- the mean and standard deviations are averaged over "subject-activity" pairs, thus the variable names are now prefixed with "Avg"
- 'f' and 't' specifiers of the original variable names are now replaced with "Frequency" and "Time" specifiers to explain the origin of the signals more clearly.

## The Data Dictionary ##


###**Subject**:
The Id of the subject/person, that was measured during a specific activity. Possible values are unsigned Integers ranging from 1 to 30, as 30 persons have been monitored during the experiments. 

###**Activity**: 
The name of the Activity being performed. Possible values are:

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING


###**Avg.Time.BodyAcc.Mean.X**: 
The averaged mean of the signals from the accelerometer concerning the body in the time domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Time.BodyAcc.Mean.Y** : 
The averaged mean of the signals from the accelerometer concerning the body in the time domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Time.BodyAcc.Mean.Z**: 
The averaged mean of the signals from the accelerometer concerning the body in the time domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Time.BodyAcc.Std.X**: 
The averaged standard deviation of the signals from the accelerometer concerning the body in the time domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Time.BodyAcc.Std.Y**: 
The averaged standard deviation of the signals from the accelerometer concerning the body in the time domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Time.BodyAcc.Std.Z**: 
The averaged standard deviation of the signals from the accelerometer concerning the body in the time domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.GravityAcc.Mean.X**: 
The averaged mean of the signals from the accelerometer concerning the gravity in the time domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.GravityAcc.Mean.Y**: 
The averaged mean of the signals from the accelerometer concerning the gravity in the time domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.GravityAcc.Mean.Z**: 
The averaged mean of the signals from the accelerometer concerning the gravity in the time domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.GravityAcc.Std.X**: 
The averaged standard deviation of the signals from the accelerometer concerning the gravity in the time domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.GravityAcc.Std.Y**: 
The averaged standard deviation of the signals from the accelerometer concerning the gravity in the time domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.GravityAcc.Std.Z**: 
The averaged standard deviation of the signals from the accelerometer concerning the gravity in the time domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyAccJerk.Mean.X**: 
The averaged mean of the jerk signals from the accelerometer concerning the body in the time domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyAccJerk.Mean.Y**: 
The averaged mean of the jerk signals from the accelerometer concerning the body in the time domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyAccJerk.Mean.Z**: 
The averaged mean of the jerk signals from the accelerometer concerning the body in the time domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyAccJerk.Std.X**: 
The averaged standard deviation of the jerk signals from the accelerometer concerning the body in the time domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyAccJerk.Std.Y**: 
The averaged standard deviation of the jerk signals from the accelerometer concerning the body in the time domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyAccJerk.Std.Z**: 
The averaged standard deviation of the jerk signals from the accelerometer concerning the body in the time domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyro.Mean.X**: 
The averaged mean of the signals from the gyroscope concerning the body in the time domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyro.Mean.Y**: 
The averaged mean of the signals from the gyroscope concerning the body in the time domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyro.Mean.Z**: 
The averaged mean of the signals from the gyroscope concerning the body in the time domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyro.Std.X**: 
The averaged standard deviation of the signals from the gyroscope concerning the body in the time domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyro.Std.Y**: 
The averaged standard deviation of the signals from the gyroscope concerning the body in the time domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyro.Std.Z**: 
The averaged standard deviation of the signals from the gyroscope concerning the body in the time domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyroJerk.Mean.X**: 
The averaged mean of the jerk signals from the gyroscope concerning the body in the time domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyroJerk.Mean.Y**: 
The averaged mean of the jerk signals from the gyroscope concerning the body in the time domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyroJerk.Mean.Z**:
The averaged mean of the jerk signals from the gyroscope concerning the body in the time domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyroJerk.Std.X**:
The averaged standard deviation of the gyro-jerk signals from the gyroscope concerning the body in the time domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyroJerk.Std.Y**: 
The averaged standard deviation of the gyro-jerk signals from the gyroscope concerning the body in the time domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyroJerk.Std.Z**: 
The averaged standard deviation of the jerk signals from the gyroscope concerning the body in the time domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyAccMag.Mean**: 
The averaged mean of the magnitude of signals from all 3 axis from the accelerometer concerning the body in the time domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyAccMag.Std**: 
The averaged standard deviation of the magnitude of signals from all 3 axis from the accelerometer concerning the body in the time domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.GravityAccMag.Mean**: 
The averaged mean of the magnitude of signals from all 3 axis from the accelerometer concerning the gravity in the time domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.GravityAccMag.Std**: 
The averaged standard deviation of the magnitude of signals from all 3 axis from the accelerometer concerning the gravity in the time domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyAccJerkMag.Mean**: 
The averaged mean of the magnitude of the jerk-signals from all 3 axis from the accelerometer concerning the body in the time domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyAccJerkMag.Std**: 
The averaged standard deviation of the magnitude of the jerk-signals from all 3 axis from the accelerometer concerning the body in the time domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyroMag.Mean**: 
The averaged mean of the magnitude of the signals from all 3 axis from the gyroscope concerning the body in the time domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyroMag.Std**: 
The averaged standard deviation of the magnitude of the signals from all 3 axis from the gyroscope concerning the body in the time domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyroJerkMag.Mean**: 
The averaged mean of the magnitude of the jerk-signals from all 3 axis from the gyroscope concerning the body in the time domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Time.BodyGyroJerkMag.Std**: 
The averaged standard deviation of the magnitude of the jerk-signals from all 3 axis from the gyroscope concerning the body in the time domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Frequency.BodyAcc.Mean.X**: 
The averaged mean of the signals from the accelerometer concerning the body in the frequency domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Frequency.BodyAcc.Mean.Y**: 
The averaged mean of the signals from the accelerometer concerning the body in the frequency domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Frequency.BodyAcc.Mean.Z**: 
The averaged mean of the signals from the accelerometer concerning the body in the frequency domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Frequency.BodyAcc.Std.X**: 
The averaged standard deviation of the signals from the accelerometer concerning the body in the frequency domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Frequency.BodyAcc.Std.Y**: 
The averaged standard deviation of the signals from the accelerometer concerning the body in the frequency domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Frequency.BodyAcc.Std.Z**: 
The averaged standard deviation of the signals from the accelerometer concerning the body in the frequency domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Frequency.BodyAccJerk.Mean.X**: 
The averaged mean of the jerk-signals from the accelerometer concerning the body in the frequency domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Frequency.BodyAccJerk.Mean.Y**: 
The averaged mean of the jerk-signals from the accelerometer concerning the body in the frequency domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Frequency.BodyAccJerk.Mean.Z**: 
The averaged mean of the jerk-signals from the accelerometer concerning the body in the frequency domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Frequency.BodyAccJerk.Std.X**: 
The averaged standard deviation of the jerk-signals from the accelerometer concerning the body in the frequency domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Frequency.BodyAccJerk.Std.Y**: 
The averaged standard deviation of the jerk-signals from the accelerometer concerning the body in the frequency domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Frequency.BodyAccJerk.Std.Z**: 
The averaged standard deviation of the jerk-signals from the accelerometer concerning the body in the frequency domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1]. 

###**Avg.Frequency.BodyGyro.Mean.X**: 
The averaged mean of the signals from the gyroscope concerning the body in the frequency domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Frequency.BodyGyro.Mean.Y**: 
The averaged mean of the signals from the gyroscope concerning the body in the frequency domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Frequency.BodyGyro.Mean.Z**: 
The averaged mean of the signals from the gyroscope concerning the body in the frequency domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1].

####**Avg.Frequency.BodyGyro.Std.X**: 
The averaged standard deviation of the signals from the gyroscope concerning the body in the frequency domain with respect to the X-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Frequency.BodyGyro.Std.Y**: 
The averaged standard deviation of the signals from the gyroscope concerning the body in the frequency domain with respect to the Y-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Frequency.BodyGyro.Std.Z**: 
The averaged standard deviation of the signals from the gyroscope concerning the body in the frequency domain with respect to the Z-Axis. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Frequency.BodyAccMag.Mean**: 
The averaged mean of the magnitude of signals from all 3 axis from the accelerometer concerning the body in the frequency domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Frequency.BodyAccMag.Std**: 
The averaged standard deviation of the magnitude of signals from all 3 axis from the accelerometer concerning the body in the frequency domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Frequency.BodyAccJerkMag.Mean**: 
The averaged mean of the magnitude of jerk-signals from all 3 axis from the accelerometer concerning the body in the frequency domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Frequency.BodyAccJerkMag.Std**: 
The averaged standard deviation of the magnitude of jerk-signals from all 3 axis from the accelerometer concerning the body in the frequency domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Frequency.BodyGyroMag.Mean**: 
The averaged mean of the magnitude of signals from all 3 axis from the gyroscope concerning the body in the frequency domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Frequency.BodyGyroMag.Std**: 
The averaged standard deviation of the magnitude of signals from all 3 axis from the gyroscope concerning the body in the frequency domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Frequency.BodyGyroJerkMag.Mean**: 
The averaged mean of the magnitude of jerk-signals from all 3 axis from the gyroscope concerning the body in the frequency domain. As values haven been normalized, the values are all in the range [-1,1].

###**Avg.Frequency.BodyGyroJerkMag.Std**: 
The averaged standard deviation of the magnitude of jerk-signals from all 3 axis from the gyroscope concerning the body in the frequency domain. As values haven been normalized, the values are all in the range [-1,1].
