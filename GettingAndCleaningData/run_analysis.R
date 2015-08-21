
# Step 1: define paths, download, unzip and load data
#----------------------------------------------------------------------------------------------------------
# define URL of file, path where it should be saved and the names of the data files
fileUrl    <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filePath   <- "."
fileName   <- paste0(filePath,"/getdata-projectfiles-UCI HAR Dataset.zip")
testFileX  <- paste0(filePath,"/UCI HAR Dataset/test/X_test.txt")
trainFileX <- paste0(filePath,"/UCI HAR Dataset/train/X_train.txt")
testFileY  <- paste0(filePath,"/UCI HAR Dataset/test/y_test.txt")
trainFileY <- paste0(filePath,"/UCI HAR Dataset/train/y_train.txt")
testFileS  <- paste0(filePath,"/UCI HAR Dataset/test/subject_test.txt")
trainFileS <- paste0(filePath,"/UCI HAR Dataset/train/subject_train.txt")
featFile   <- paste0(filePath,"/UCI HAR Dataset/features.txt")
actFile    <- paste0(filePath,"/UCI HAR Dataset/activity_labels.txt")

# download zip file and unzip it (only if it doesn't exist already)
if(!file.exists(fileName))
{
    if(!file.exists(filePath)){ dir.create(filePath) }
    download.file(fileUrl,destfile=fileName)
}
unzip(fileName, exdir = filePath, overwrite = FALSE)

# load data
testDataX  <- read.table(testFileX)
trainDataX <- read.table(trainFileX)
testDataY  <- read.table(testFileY)
trainDataY <- read.table(trainFileY)
testDataS  <- read.table(testFileS)
trainDataS <- read.table(trainFileS)

featNames  <- read.table(featFile,stringsAsFactors = FALSE)[,2]
actNames   <- read.table(actFile,stringsAsFactors = FALSE)[,2]


# Step 2: bind train and test data and gives descriptive feature names
#----------------------------------------------------------------------------------------------------------
# bind all data to one dataframe and name the variables
dataX <- rbind(testDataX,trainDataX)
dataY <- rbind(testDataY,trainDataY)
dataS <- rbind(testDataS,trainDataS)
rm(testDataX,testDataY,testDataS)
rm(trainDataX,trainDataY,trainDataS)

names(dataX) <- featNames
names(dataY) <- "Activity"
names(dataS) <- "Subject"

data  <- cbind(dataS,dataY)
data  <- cbind(data,dataX)
rm(dataX, dataY, dataS)


# Step 3: remove non mean and non std variables (except subject and activity) and cleanup feature names
#----------------------------------------------------------------------------------------------------------
# remove non mean and non std variables (but keep subject and activity too)
meanIdx <- grepl("mean()",names(data),fixed=TRUE)
stdIdx  <- grepl("std()",names(data),fixed=TRUE)
idx <- c(1:2,which(meanIdx | stdIdx))
dataReduced <- data[,idx]

# cleanup of feature names
names(dataReduced) <- gsub("-",".",names(dataReduced), fixed=TRUE)
names(dataReduced) <- gsub("^t","Time.",names(dataReduced))
names(dataReduced) <- gsub("^f","Frequency.",names(dataReduced))
names(dataReduced) <- gsub("mean()","Mean",names(dataReduced), fixed=TRUE)
names(dataReduced) <- gsub("std()","Std",names(dataReduced), fixed=TRUE)
names(dataReduced) <- gsub("BodyBody","Body",names(dataReduced), fixed=TRUE)

rm(data)


# Step 4: replace activity ids with corresponding labels as factors
#----------------------------------------------------------------------------------------------------------
dataReduced <- dataReduced[order(dataReduced[,"Subject"],dataReduced[,"Activity"]), ]
dataReduced[,"Activity"] <- sapply(dataReduced[,"Activity"], function(a) {as.factor(actNames[a])} )


# Step 5: calculate the average of each subject and actvitiy pair for all columns and save the data to HD
#----------------------------------------------------------------------------------------------------------
dataTidy <- aggregate(. ~ Activity + Subject, data=dataReduced, FUN=mean)
dataTidy <- dataTidy[,c("Subject","Activity",names(dataTidy)[-c(1,2)])] 
names(dataTidy)[-c(1,2)] <- paste0("Avg.",names(dataTidy)[-c(1,2)])
rm(dataReduced)

write.table(dataTidy,paste0(filePath,"/dataTidy.txt"),row.names=FALSE)

# Note: How to read the table
#----------------------------------------------------------------------------------------------------------
# dt <- read.table(paste0(filePath,"/dataTidy.txt"),header=TRUE)




