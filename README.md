# propublica-congress-api
Analysis of Congressional Activity

## Overview
Using the Congress API, you can retrieve legislative data from the House of Representatives, the Senate and the Library of Congress. The API, which originated at The New York Times in 2009, includes details about members, votes, bills and other aspects of congressional activity.

## Goals
Use the Congress API to examine voting patterns of local representatives and comparing trends at a state and national level.

## Project Roadmap
None at this point

## Data Source
Data obtained through Propublica [Congress API](https://propublica.github.io/congress-api-docs/)
NOTE: You must get the API Key to use this API. Contact NorfolkDataSci@gmail.com for the key and instructions to use.

## Getting Started with R
This project has been created and initialized with Packrat (a package management system for enhanced reprodicibility
in R). This means that if you need additional libraries, just run `install.packages()` and the resulting 
packages will be installed in the packrat library so that other users will have exactly the same configuration
as you! Plus, this won't mess with your existing set of installed packages on your personal computer. Here is a 
simple workflow with Packrat:

```
> install.packages('xml2')
> packrat::snapshot(prompt = FALSE)
Adding these packages to packrat:
         _      
    xml2   1.0.0
```