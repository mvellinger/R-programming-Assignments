pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used

    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!

    ##initialize a list to hold our data frames
    #mylist <- list()
    #initialize a vector to hold the values we retrieve
    storage <- numeric()

    ##Start our first For loop, walking through our id range
    for(i in seq_along(id)) {


        ##NOTE: step 1; format the filename.
        # we will do this with a nested elseif to cover the three possible scenarios:
        #scenario 1: id is between 1 and 9 and we need to prefix two zeros
        #scenario 2: id is between 10 and 99 and we need to prefix one zero
        #scenario 3: id is greater than 99, and we do not need to prefix
        #
        #this is true because the file format is "xxx.csv"

        if(id[i] <= 9) {

            filenumber <- paste("00", id[i], sep="")

        } else if(id[i] <= 99) {

            filenumber <- paste("0", id[i], sep="")

        } else {

            filenumber <- paste(id[i], sep="")
        }


        ##NOTE: step 2; merge the directory with the filenumber
        #we will take our filenumber and combine it with the directory variable
        #to retrieve the full path+filename for reading the file into R

        filename <- paste(directory,"/", filenumber, ".csv", sep="")

        ##NOTE: step 3; retrieve the data from the csv file(s) and place the contents
        #of each file into a frame, inside a list.
        temp <- read.csv(filename)
        tempvector <- temp[, pollutant]
        storage <- append(storage, tempvector)

    }

    mean(storage, na.rm=TRUE)


}
