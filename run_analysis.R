read.data <- function(data_mode, prefix) {
        file_name <- paste(prefix, "_", data_mode, ".txt", sep="")
        
        loc <- paste(parent_data_dir, data_mode, file_name, sep="/")
        
        return(read.table(loc))
}

combine.data <- function(data_mode = "train") {
        
        # read x data
        
        selected.data <- read.data(data_mode, "X")[, columns]
        
        # read y data
        
        activities <- read.data(data_mode, "y")
        
        # bind activity data
        
        activities.val <- activities.name[activities[, 1]]
        
        # read subject data
        
        subjects <- read.data(data_mode, "subject")
        
        # selected.data$subject <- subjects[, 1]
        
        return(cbind(subjects, activities.val, selected.data))
}

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

parent_data_dir <- "./UCI HAR Dataset"

features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=F)[, 2]

columns <- grep("(mean\\(\\))|(std\\(\\))", features)

features.name <- features[columns]

activities.name <- read.table("UCI HAR Dataset/activity_labels.txt")[, 2]

tidy.all.data()


