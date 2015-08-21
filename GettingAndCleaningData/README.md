GACDCourseProject README
=================

Readme on Course Project for Getting and Cleaning Data Course from Coursera by Paier Philipp

----------

## The Original Data & Project Description ##
The purpose of this project was to transform a dataset, which can be considered unorganized and untidy, into a tidy dataset. The original dataset was obtained by measuring a variety of measurements with the help of a Samsung Galaxy S smartphone during the time of certain activities performed by a number of subjects. A full description on the original dataset can be obtained here:<br/>
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  "Original Dataset Description")<br/>
and the dataset itself can be found here:<br/>
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

However this dataset can be considered untidy, as the data and information is spread across multiple files and can't be analyzed right away. The goal of this project was to merge the data, summarize it in some way and create a tidy dataset with descriptive column names and activity names according to the following task description:

> You should create one R script called run_analysis.R that does the following. <br/>
> 1.) Merges the training and the test sets to create one data set.<br/>
> 2.) Extracts only the measurements on the mean and standard deviation for each measurement. <br/>
> 3.) Uses descriptive activity names to name the activities in the data set <br/>
> 4.) Appropriately labels the data set with descriptive variable names. <br/>
> 5.) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

In the next section it will be explained what the implementation on hand of the run_analysis.R script is doing to perform the necessary steps mentioned above and why certain design decisions have been made. 

## The run_analysis Script ##
1. In order for the  script to perform it's task, the original dataset must be in the current working directory of the R session. That means, that the zip file must be extraxted into the current working directory, resulting in a folder called 'UCI HAR Dataset', that contains all the data. However this is actually all implemented in th erun_analysis.R script. It first downloads the data and extracts it into the current working directory, but only if the data isn't already there. Note, that this might lead to some warnings, caused by the unzip functionality, whenever it decides not to overwrite an existing file. Those warnings are therefore harmless. The script then loads all relevant files into the R workspace using the read.table function.
2. Once all the data is loaded it merges it in the following way. First train and test data for the measurement variables (indicated by an 'X' in the filename) are put together by using rbind. Then the same is done with the activity ids (indicated by an 'Y') and the subject ids (indicated by 'subject'), resulting in three dataframes. Note that for each of those "talbes" exactly the same number of observations are made and that they correspond to eachother, meaning that the 100th line in the X_train file corresponds to the 100th line in the y_train  and subject_train files. Therefore it is possible to use cbind to concatenate the three dataframes into one large one. Additionally column names are added to the dataframe. 'Subject' and 'Activity' are used for subject id and activity id and for the measurements the names are taken from the features.txt file. Note, that the latter will be replaced by more descriptive names at the end of the next step, but are temporarily taken as they are to make parsing the names easier in the beginning of the next step.
3. Now all measurement columns of the dataframe are kept, that contain either the string "mean()" or the string "std()". The rest is thrown away. Note, that in the original dataset there also exist some measurement variables that contain the string 'Mean'. Those ar not actual means, but angles that use a respective mean variable and are therefore thrown away. Also variables containing meanFreq() are not actual means of the measurment but the mean frequency of the measurement and therefore also thrown away. This entire procedure results in 68 columns for the new dataframe. One for the subject, one for the actvity and 66 means and std deviations of measurements. After "reducing" the data, the column/variable names are further cleaned up to be more descriptive and easier to handle. Therefore 'f' and 't' are replaced by 'Frequency' and 'Time', '-' is replaced by '.' and 'mean()' and 'std()' are rpelaced by 'Mean' and 'Std' to be consistent with the rest of the descripton. The exact meaning of the variables after the last changes in step 5.) are explained in the CodeBook.md file in the repository at hand.  
4. As in the activity column are still ids instead of descriptive activity names, the information from activity_labels.txt file is now used together with an sapply statement to map each activity id in the dataframe to its label. Note, that this step could also be done during step 2.), before step 3.) or at the end.
5. Now the current dataframe consists of 68 columns and over 10000 rows/observations, though there are only 30 subjects and 6 activities. This is the case, because each subject has been monitored at each activity a few times and not just once. The finale task of this project was now to calculate the average of each measurement for one subject and activity. This is done using the aggregate function. Now the meanings of the measurement variables have slightly changes as they are now averages of measurements. Therefore the column/variable names are changed once more by adding 'Avg.' at the beginning to indicate, that the variable represents an average value taken over various measurements. Finally the resulting dataframe has **180 rows** and **68 columns** and is saved in the current working directory as "dataTidy.txt".

## Additional Notes ##
- The resulting dataset can be loaded into R using the command <br />
`dt <- read.table("dataTidy.txt",header=TRUE)`
- If you have problems with the dowloading part of the script, try downloading with the curl method. Use <br /> `download.file(fileUrl,destfile=fileName, method="curl")` instead of the original statement in line 21. <br />
Under Windows the curl method made problems, but under Linux or MacOS it might get necessary to use it.
- There are some statements in the code that remove temporary dataframes to reduce RAM usage, and some statements  are used to reorder the rows and columns. They are not necessary but help to make the dataframe easier to be read.
- The resulting dataframe is a tidy one, as each column represents one variable and each row represents one observation. A point can be made to further narrow down the dataframe. E.g. instead of using one varibale for for each measurement, one can say that a measurement consists of a domain, a signal type, a measurement type, an axis and a value. And each rows is a combination of those variables together with subject and activity. This structure would also be tidy - and depending on the task at hand - can be easier to work with. However as the original dataset was for prediction, the "wider" tidyData as produced by my solution seems to be more fitting as it would be more intuitive to make some sort of prediction for a new subject based on those 66 measurement variables by just comparing them with the ones in the dataframe, without having to reorganizing the dataframe again. Also the tidy data produced by my solution is likely easier to understand and shows it's purpose at first glance.