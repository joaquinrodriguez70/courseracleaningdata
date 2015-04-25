## Code Book forCoursera Cleaning data Assignment

In this code book are the following items
* Description of the observations
* Main file descriptions
* File processing script (Giving a  tidy data set as a result)

### Raw data Overview

Volunteers activities in  6 different activities were recorded by Samsung smatphones.

### Explanation of each file
####Metadata
* `features.txt`: Names of the 561 features.
* `activity_labels.txt`: Names and IDs for each of the 6 activities.

####Data
* `X_train.txt`: 7352 observations  (70 % of all observations)
* `subject_train.txt`: An integer vector indicating the subject associated with the train observations in `X_train.txt`.
* `y_train.txt`: An integer vector indicating the id of the activity related with the train observations in `X_train.txt`.
* `X_test.txt`: 2947 observations (30 % of all observations)
* `subject_test.txt`: An integer vector indicating the subject associated with the test observations in  `X_test.txt`.
* `y_test.txt`: An integer vector indicating the id of the activity related with the test observations in `X_test.txt`.

The full information about the files is available in `README.txt`. More information about the features is available in `features_info.txt`.


The raw signal data in the ("Inertial Signals") are ommited from the processing.

### Processing steps (done by the run_analysis script)

1. The features and activities area read into data frames 
2. The test and train data files are read  and consolidated with the correspondig subject and activity 
3. The test and tran data are meged into one data frame
4. The data frame is written into a file

* The columns different of the  "mean, Mean and std" observations are filtered out 
* The activity column is in text form 

5. The tidy data set was output to a TXT file.
