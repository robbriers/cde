
<!-- README.md is generated from README.Rmd. Please edit that file -->
cde package
===========

[![Travis-CI Build Status](https://travis-ci.org/robbriers/cde.svg?branch=dev)](https://travis-ci.org/robbriers/cde) [![Coverage Status](https://coveralls.io/repos/github/robbriers/cde/badge.svg?branch=dev)](https://coveralls.io/github/robbriers/cde?branch=dev) [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

R package to extract and plot WFD waterbody status data from the [Environment Agency Catchment Data Explorer](http://environment.data.gov.uk/catchment-planning/) (CDE) site. The data that are downloaded and summarised using this package are made available under the [Open Government Licence v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).

Installation
------------

You can install cde from github with:

``` r
# install.packages("devtools")
devtools::install_github("robbriers/cde")
```

Basic usage
-----------

There are three main functions in the package:

`search_names`

This allows you to search the listing of sites, catchments or river basin districts on the CDE website to locate those that match the string specified. The output of this can then be used to define inputs for the following functions.

Searching can be performed by waterbody name (`name`), Management Catchment (`MC`), Operational Catchment (`OC`) or River Basin District (`RBD`).

The function returns a dataframe containing all rows that match (or partial match) the input string.

``` r
# search for Management Catchments containing the string 'Avon'
search_names("Avon", "MC")

# search for waterbodies containing the string 'Till'
search_names("Till", "name")
```

`get_status`

This retrieves status data from the CDE site. The data can be retrieved by specifying waterbody id (`WBID`), Management Catchment (`MC`), Operational Catchment (`OC`) or River Basin District (`RBD`). Start year (`startyr`) and end year (`endyr`) allow specific timeranges to be downloaded. For Management Catchment (`MC`), Operational Catchment (`OC`) or River Basin District (`RBD`) level downloads, waterbody type (`type`) can also be specified to allow extraction of specific waterbody types ("River", "Lake", "GroundWaterBody", "TransitionalWater" or "CoastalWater". The classification level (`level`) can also be specified; this defaults to "Overall Water Body", which is the Level 4 classification. Other possible values are:

| Level 1      | Level 2                                | Level 4            |
|--------------|----------------------------------------|--------------------|
| Ecological   | Biological quality elements            | Overall water body |
| Chemical     | Chemical Status element                | -                  |
| Quantitative | Hydromorphological Supporting Elements | -                  |
| -            | Other Substances                       | -                  |
| -            | Physico-chemical quality elements      | -                  |
| -            | Priority hazardous substances          | -                  |
| -            | Priority substances                    | -                  |
| -            | Quantitative Status element            | -                  |
| -            | Specific pollutants                    | -                  |
| -            | Supporting elements                    | -                  |

For full details of the classification hierarchy used, see the details [here](https://environment.data.gov.uk/catchment-planning/help#help-classification-hierarchy).

The function returns a dataframe containing the status (and other details) for the specified combination of column, value, level and dates. Note that during 2013 and 2014 waterbodies were classified under both Cycle 1 and Cycle 2 methodologies. The status information extracted for these years is just for the Cycle 2 classification, to avoid double counting.

``` r
# get status information for Lakes in the Avon Hampshire Management 
# Catchment in 2012
get_status("Avon Hampshire", "MC", startyr=2012, type="Lake")

# get status information for all waterbodies within the Solway Tweed
# River Basin District in all years (2009-2015)
get_status("Solway Tweed", "RBD")

# get status information for all waterbodies within the Humber
# River Basin District between 2012 and 2014 (BIG - 2985 rows!)
get_status("Humber", "RBD", startyr=2012, endyr=2014)

# get status information for WBID  GB102021073050 between 2009 and 2012
get_status("GB102021073050", "WBID", startyr=2009, endyr=2012)
```

`plot_status`

This produces summary barplots of percentage of waterbodies at different status. As for `get_status` the year range, level and type can be specified, along with colour scheme. The default is `scheme="vir"`, which is a `viridis`-based scheme. The alternative is `scheme="wfd"`, which gives the status colours specified within the WFD. Only works for Management/Operational Catchments or River Basin District level searches.

When a single year is specified, the bars represent the percentage of waterbodies in each status class. When multiple years are specified, the output is a stacked barplot of status percentages for each year.

``` r
# plot status information for Lakes in the Avon Hampshire Management 
# Catchment in 2012
plot_status("Avon Hampshire", "MC", startyr=2012, type="Lake")

# plot status information for all waterbodies within the Solway Tweed
# River Basin District in all years (2009-2015) using WFD colours
plot_status("Solway Tweed", "RBD", scheme="wfd")

# plot status information for all waterbodies within the Humber
# River Basin District between 2012 and 2014
plot_status("Humber", "RBD", startyr=2012, endyr=2014)
```
