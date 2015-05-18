corr <- function(directory, threshold = 0) {

    #initiate empty vector

    results <- numeric()
    #first, retrieve all the filenames, in case the instructor is being sneaky,
    #and has more files in his specdata folder than I do...

    filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)

    #for loop, apply once for each element in the filenames vector
    for(i in seq_along(filenames)) {

        #read the data from the csv file into a dataframe, ignoring any rows with an NA entry
        tempframe <- na.omit(read.csv(filenames[i]))

        #provided the number of entries is above the threshold value, correlate the two values
        #in the 2nd and 3rd columns and append the result to the results vector
        if(nrow(tempframe) > threshold) {
            results <- append(results, cor(tempframe[,2], tempframe[,3]))
        }
        else {

        #skip the file if the threshold is not reached
            next
        }

    }
    #output the results vector so the function can return it.
    results
}
