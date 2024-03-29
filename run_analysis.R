# this is the function to read the data based on the pattern 
read.data <- function(data_mode, prefix) {
        file_name <- paste(prefix, "_", data_mode, ".txt", sep="")
        
        loc <- paste(parent_data_dir, data_mode, file_name, sep="/")
        
        return(read.table(loc))
}


# this function will combine activities, subjects to the selected data from one mode (ex: train)
combine.data <- function(data_mode = "train") {
        
        # read x data
        
        selected.data <- read.data(data_mode, "X")[, columns]
        
        # read y data
        
        activities <- read.data(data_mode, "y")
        
        # bind activity data
        
        activities.val <- activities.name[activities[, 1]]
        
        # read subject data
        
        subjects <- read.data(data_mode, "subject")
        
        return(cbind(subjects, activities.val, selected.data))
}

# this procedure will download the file if not exist and unzip it 
download.rawdata <- function(url='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', output.file='getdata-projectfiles-UCI HAR Dataset.zip') {
        
        ## If data directory is not present we should download dataset
        if (!file.exists('UCI HAR Dataset')) {
                
                # if the zip file has already in the directory
                if(!file.exists(output.file)) {
                        print('Downloading dataset')
                        status <- download.file(url, output.file, method='curl')
                        if (status != 0) {
                                stop ( paste('Download failed:', url))
                        }
                }
                
                #unzip(output.file)
                file.remove(output.file)
        }
}

# this function will combine train and test data set that has been prepared before and 
# calculate the aggregate and then write to tidy.txt for tab separated value that 
# can be loaded from read.table("tidy.txt")
tidy.all.data <- function() {
        
        train_data <- combine.data("train")
        
        test_data <- combine.data("test")
        
        all.data <- rbind(train_data, test_data)
        
        colnames(all.data) <- c("subject", "activity", features.name)
        
        tidy.data = aggregate(all.data[,3:68],by=list(all.data$activity, all.data$subject), FUN=mean)
        
        colnames(tidy.data)[1:2] <-c('activity', 'subject')
        
        tidy.data = tidy.data[c(2, 1, 3:ncol(tidy.data))]
        
        write.table(tidy.data, file = "tidy.txt")
}


##### this is the main program  #####

download.rawdata()

parent_data_dir <- "./UCI HAR Dataset"

features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=F)[, 2]

columns <- grep("(mean\\(\\))|(std\\(\\))", features)

features.name <- features[columns]

activities.name <- read.table("UCI HAR Dataset/activity_labels.txt")[, 2]

tidy.all.data()


