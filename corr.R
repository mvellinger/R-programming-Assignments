corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!

        #initiate vector

        results <- numeric()
        #first, retrieve all the filenames, in case the instructor is being sneaky,
        #and has more files in his specdata folder than I do...

        filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)

        #for loop
        for(i in seq_along(filenames)) {
            tempframe <- na.omit(read.csv(filenames[i]))

            if(nrow(tempframe) > threshold) {
                results <- append(results, cor(tempframe[,2], tempframe[,3]))
            }
            else {
                next
            }

                                       }
       results 
}
