complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases


    
        #init dataframe to specs
        df <- read.table(text="", col.names = c("id", "nobs"))

        #for loop
        for(i in seq_along(id)) {


            if(id[i] <= 9) {

                filenumber <- paste("00", id[i], sep="")

            } else if(id[i] <= 99) {

                filenumber <- paste("0", id[i], sep="")

            } else {

                filenumber <- paste(id[i], sep="")
            }

            filename <- paste(directory,"/", filenumber, ".csv", sep="")
            temp <- read.csv(filename)
            subsettemp <- na.omit(temp)
            df[i,1] <-id[i]
            df[i,2] <-nrow(subsettemp)
        }
        df
}
