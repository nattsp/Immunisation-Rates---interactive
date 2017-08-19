#Store the file URL
fileUrl1 <- "http://www.immunise.health.gov.au/internet/immunise/publishing.nsf/Content/B0729B4D351BD2DCCA258162001F1B46/$File/xAll-PHN_March-2017.xlsx"
fileUrl2 <- 
fileUrl2 <- 
    
    
#If the file doesn't exist in the data directory then download it
if(!file.exists(".\\data\\repdata-data-StormData.csv.bz2")){
    download.file(fileUrl, destfile = ".\\data\\repdata-data-StormData.csv.bz2", 
                  mode = "wb")
    dateDownloaded <- date()
    dateDownloaded
}


dataDetails <- read.xlsx2(
    file = ".\\data\\dataDetails.xlsx"
    ,sheetName = "Sheet1"
)

readFile <- function(x, output){
    if(!file.exists(x[2])){
        download.file(
            x[1]
            ,destfile = x[2]
            ,mode = "wb"
        )
    }
}
apply(dataDetails, 1, readFile)


##########################
library(data.table)
dataDetails <- read.xlsx2(
    file = ".\\data\\dataDetails.xlsx"
    ,sheetName = "Sheet1"
    ,colClasses = c(
        "character"
        ,"character"
        ,"character"
        ,"numeric"
        ,"numeric"
        ,"numeric"
        ,"character"
    )
)
sapply(dataDetails,class)

immClasses <- c(
    "character"
    ,"character"
    ,"character"
    ,"numeric"
    ,"numeric"
    ,"numeric"
    ,"numeric"
    ,"numeric"
    ,"numeric"
    ,"numeric"
    ,"numeric"
    ,"numeric"
)

colClean <- function(x){
    colnames(x) <- gsub("\\.+", "_", colnames(x));
    colnames(x) <- gsub("X_", "PCT_", colnames(x));
    colnames(x) <- gsub("_$", "", colnames(x));
    x 
}

ageFactors <- function(x){
    x <- factor(
        x
        ,levels = c(
            "12-<15 Months"
            ,"24-<27 Months"
            ,"60-<63 Months"
        )
        ,ordered=TRUE
    );
    x
}
readFile2 <- function(x){
    print(x[2])
    print(x[3])
    print(as.numeric(x[4]))
}
readFile2 <- function(x){
    
    immData <- read.xlsx2(
        file = x[[2]]
        ,sheetName = x[[3]]
        ,startRow = as.numeric(x[4])
        ,endRow = as.numeric(x[5])
        ,colClasses = immClasses
    )
    immData <- colClean(immData)
    
    print(x[[6]])
#    print(as.Date(as.numeric(x[6]), origin="1899-12-30"))
    print(as.Date(as.numeric(x[6])-2, origin="1900-01-01"))
    immData <- mutate(immData, Time_Period = as.Date(as.numeric(x[6])-2, 
                                                     origin="1900-01-01"))
    
}

allframes <- apply(dataDetails, 1, readFile2)
immDataAll <- do.call(rbind,allframes)

immDataAll$Age_Group <- ageFactors(immDataAll$Age_Group)

save(immDataAll, file = ".\\data\\processed\\immDataAll.Rda")



for (i in c(1 : nrow(dataDetails))){
    immData <- readFile2(dataDetails[i, ])
}

if (exists(immDataAll)) remove(immDataAll)

xeg <- dataDetails[1,]
readFile2(xeg)
xeg[2]
