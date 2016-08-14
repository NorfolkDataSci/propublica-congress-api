# Using this script: 
# this script is meant to demonstrate how to pull data from the Propublica Congress API
# which provides detail on the activities of congress mainly 

# turn off stringsAsFactors because they make text analysis hard

options(stringsAsFactors = FALSE)

# load packages

suppressMessages(suppressWarnings(suppressPackageStartupMessages(library(plyr))))
suppressMessages(suppressWarnings(suppressPackageStartupMessages(library(dplyr))))
suppressMessages(suppressWarnings(suppressPackageStartupMessages(library(ggplot2))))
suppressMessages(suppressWarnings(suppressPackageStartupMessages(library(ggthemes))))
suppressMessages(suppressWarnings(suppressPackageStartupMessages(library(scales))))
suppressMessages(suppressWarnings(suppressPackageStartupMessages(library(lubridate))))
suppressMessages(suppressWarnings(suppressPackageStartupMessages(library(xml2))))
suppressMessages(suppressWarnings(suppressPackageStartupMessages(library(rjson))))
suppressMessages(suppressWarnings(suppressPackageStartupMessages(library(httr))))

# get list of Senate or House members --------------------------------------------------------------------------------------
# https://propublica.github.io/congress-api-docs/#members
# GET https://api.propublica.org/congress/v1/{congress}/{chamber}/members.json
# Parameter	  Description
# congress	  102-114 for House, 80-114 for Senate
# chamber	    house or senate

result <- GET("https://api.propublica.org/congress/v1/114/house/members.json", 
         add_headers(`X-API-Key` = Sys.getenv("CONGRESS_API_KEY")))
parsed_result <- content(result, 'parsed')

# you still need to convert this list into a data.frame
# loop through each member, convert to 1 row data.frame, bind all rows together
members <- ldply(parsed_result$results[[1]]$members, 
                 .fun=function(x){
                    as.data.frame(x[!sapply(x, is.null)])
                   }
                 )

# https://propublica.github.io/congress-api-docs/#get-bills-cosponsored-by-a-specific-member
# GET https://api.propublica.org/congress/v1/members/{member-id}/bills/{type}.json
# This will get bills specifically cosponsored by Robert Hurt

result <- GET("https://api.propublica.org/congress/v1/members/H001060/bills/cosponsored.json", 
              add_headers(`X-API-Key` = Sys.getenv("CONGRESS_API_KEY")))
parsed_result <- content(result, 'parsed')

cosponsored_bills <- ldply(parsed_result$results[[1]]$bills, 
                           .fun=function(x){
                             as.data.frame(x[!sapply(x, is.null)])
                           }
                          )
