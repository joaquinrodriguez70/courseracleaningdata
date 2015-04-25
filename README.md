# Coursera Cleaning data Assignment
This is a repo for the assigment in the coursera cleaning data  course.

The assigment project is formed by
* Download the  ["Human Activity Recognition Using Smartphones" data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
* Analize the data set 
* Create a script that write a  tidy data set from the raw data.
* Create a Codebook describing the data

This repo has a script named "run_analysis.R" which creates a tidy data set from test and train data from 
samsung mobile devices 

**The steps that must be performed to get the tidy data set are :**

1. Download the zip file from [this URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file.
3. Download the R script ([run_analysis])((https://raw.githubusercontent.com/joaquinrodriguez70/courseracleaningdata/master/run_analysis.R)) into the unizpped directory created in the above step.
4. Run the R script ([run_analysis.R](run_analysis.R)).** Note that it requires the [dplyr package](http://cran.r-project.org/web/packages/dplyr), which can be downloaded from CRAN.

**The output of the R script is a tidy data set, [JRLDATA.txt](JRLDATA.txt).**

The data is described in the[Code book](code-book.md).


** In this repo  is a copy of the unzipped data files