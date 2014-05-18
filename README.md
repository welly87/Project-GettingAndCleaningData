Coursera Getting and Cleaning Data Project
========================================================

One of the most exciting areas in all of data science right now is wearable computing - see for example [this](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:  [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). This file will be downloaded if you run the script and connected to the internet. If you prefer working offline then you need to download this dataset first and then put it in the same directory with run_analysis.R

The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 



This project will contain  

 - run_analysis.R - this script will download the file if connected to internet, extract it, clean and tidy your dataset and finally output the new dataset (tidy.txt) with tab separated value. You can read this new dataset read.table("tidy.txt")
 
 - CodeBook.md - a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data 
 
I only tested this project in this following environment :

1. *Computer Architecture* : CPU (Intel)
2. *Operating System* : Windows (x86_64-w64-mingw32/x64)
3. *Software toolchain* : R version 3.0.2 (2013-09-25)
4. *Supporting software and dependencies* : 
5. *External dependencies* : This project will need to access the dataset if it's not exist from the url described above. 

Here's my session info collected from R

```
R version 3.0.2 (2013-09-25)
Platform: x86_64-w64-mingw32/x64 (64-bit)

locale:
[1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252   
[3] LC_MONETARY=English_United States.1252 LC_NUMERIC=C                          
[5] LC_TIME=English_United States.1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

loaded via a namespace (and not attached):
[1] tools_3.0.2
```