
###############################################################################
#Helper function that Reads from a file and returns a data frame
#useful to get the column names 
###############################################################################
readFileIntoDF <-function(directory,aFile) {

  setwd(directory)
  myDF<-read.table(aFile)
  myDF
  
}


###############################################################################
# Helper function which Reads Data Files and binds colums from subject + activity type + mesauraments 
###############################################################################
readMyDataFile <-function(directory,obsFile,subjectFile,yObsFile,columnsNames561,activityLabels, readNrows=-1) {
 
  #df_data is the main data frame
  #cd to directory and read data into  the main data frame
  setwd(directory)
  df_data<-read.table(obsFile,nrows = readNrows)

  #df_yaxisData has the activityID
  #read the activityLabels
  df_yaxisData<-read.table(yObsFile,nrows = readNrows)
  names(df_yaxisData) <-c("Activity")
  
  #df_subject has the subject ID 
  df_subject_ID<-read.table(subjectFile,nrows = readNrows)
  names(df_subject_ID)<-c("Subject")
  
  #binds activity to subject
  df_activities<-data.frame(sapply(df_yaxisData$Activity,function(x) as.character(activityLabels[x,2]) ) )
  names(df_activities)<-c("Activity")
  df_subject_ID<-dplyr::bind_cols(df_subject_ID,df_activities)
                                 
  #add names of variables to the main data frame
  names(df_data)<-columnsNames561[[2]]
  
  
  #adds subject ID & Activity  to main data frane
  df_data<-dplyr::bind_cols(df_subject_ID,df_data)
  
   
  df_data
  
}

###############################################################################
#Main Function  createTidy
###############################################################################
createTidy<-function (){

  
#DEFINITIONS
#If readNrows > -1 a subset is read ( useful for testing)
# -1 means all data is read
#--------------------------------------------------------------------
readNrows = -1
txtFeaturesDirectory <-"~/Documents/week6/UCI HAR Dataset"
txtTestDirectory <-paste(txtFeaturesDirectory,"/test/",sep="")
txtTrainDirectory<-paste(txtFeaturesDirectory,"/train/",sep="")

testFileName <-"X_test.txt"
trainFileName <-"X_train.txt"

featuresFileName <- "features.txt"
activityLablesFileName <-"activity_labels.txt"

subjectTestDataFileName <-"subject_test.txt"
subjectTrainDataFileName <-"subject_train.txt"

yTestDataFileName <-"y_test.txt"
yTrainDataFileName <-"y_train.txt"

columnsRegex <-".Mean.|.mean.|.std.|Subject|Activity"

#A progress bar is added
pb <-txtProgressBar(min = 0, max = 6, initial = 0, char = "=",style=3)

#Step 1, get names of measures (column  names) from file 
columnsNames561  <-readFileIntoDF (txtFeaturesDirectory,featuresFileName) 
#Step 2, get names of types of activities from file 
activityLabels <-readFileIntoDF (txtFeaturesDirectory,activityLablesFileName) 
setTxtProgressBar(pb,1)  

#Step 3, read test data from file  into df_data_test data frame
df_data_test<-readMyDataFile (txtTestDirectory,testFileName,subjectTestDataFileName,yTestDataFileName,columnsNames561,activityLabels, readNrows)
setTxtProgressBar(pb,2)  

#Step 4, read train data from file  into df_data_train data frame
df_data_train<-readMyDataFile (txtTrainDirectory,trainFileName,subjectTrainDataFileName,yTrainDataFileName,columnsNames561,activityLabels,readNrows)
setTxtProgressBar(pb,3)  

#Step 5 bind train and test data frames into a single data frame (df_data_test) and removes innecesary data from workspace
df_data_test <- dplyr::bind_rows(df_data_test, df_data_train)
rm(df_data_train)
setTxtProgressBar(pb,4)

#Step 6, filter the mesaurements to get only standard dev and mean variables 
df_data_test<-dplyr::select(df_data_test,matches(columnsRegex))

setTxtProgressBar(pb,5)  

#Setep 7 use reshape to get the avg
df_melted <- melt(df_data_test, id=c("Subject","Activity"))
tidyResult <- dcast(df_melted, Subject+Activity ~ variable, mean)

setTxtProgressBar(pb,6)  

#Final step write results

write.table(tidyResult,row.names = FALSE,file = "JRLDATA.txt")
#return the data frame as a result
tidyResult

}