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

1. The features and activities area read into data frames All of the relevant data files were read into data frames, appropriate column headers were added, and the training and test sets were combined into a single data set.
2. All feature columns were removed that did not contain the exact string "mean()" or "std()". This left 66 feature columns, plus the subjectID and activity columns.
3. The activity column was converted from a integer to a factor, using labels describing the activities.
4. A tidy data set was created containing the mean of each feature for each subject and each activity. Thus, subject #1 has 6 rows in the tidy data set (one row for each activity), and each row contains the mean value for each of the 66 features for that subject/activity combination. Since there are 30 subjects, there are a total of 180 rows.
5. The tidy data set was output to a TXT file.
