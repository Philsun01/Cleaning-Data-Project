library(dplyr)
#read all the files
  #x_train <- read.table("UCI HAR Dataset/train/x_train.txt",
  #                      stringsAsFactors = FALSE)
  #y_train <- read.table("UCI HAR Dataset/train/y_train.txt",
  #                      stringsAsFactors = FALSE)
  #x_test <- read.table("UCI HAR Dataset/test/x_test.txt",
  #                      stringsAsFactors = FALSE)
  #y_test <- read.table("UCI HAR Dataset/test/y_test.txt",
  #                      stringsAsFactors = FALSE)
  #activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
  #                              stringsAsFactors = FALSE)
  #features <- read.table("UCI HAR Dataset/features.txt",
  #                       stringsAsFactors = FALSE)
  ###Create a features vector
  #features <- features$V2

analyze <- function(x_train,y_train,x_test,y_test,act,features) {
  
  ### Add merge and add activity labels
  train_rowlabel <- merge(y_train, act)
  test_rowlabel <- merge(y_test, act)
  
  colnames(train_rowlabel) <- c("Category","Activity")
  colnames(test_rowlabel) <- c("Category","Activity")
  
  ### Add Column feature labels
  colnames(x_train) <- features
  colnames(x_test) <- features

  ### Combine train and test activity categories
  test <- cbind(test_rowlabel,x_test)
  train <- cbind(train_rowlabel,x_train)
  
  ### Combine train and test dataframes
  act_data <- rbind(train,test)
  
  ### Extract activity, mean, and standard deviation columns
  act_select <- cbind(act_data[,1:2],
                     act_data[ ,grepl("std|mean",names(act_data))])
  
  ### group by activity 
  act_group <- group_by(act_select,Activity)
  
  ###summarize mean for each Activity
  act_mean <- summarise_each(act_group,funs(mean))
  
  return(act_mean)
}