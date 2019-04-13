---
title: 'cde - R package to retrieve data from the Environment Agency Catchment Data Explorer site'
tags:
  - R
  - water quality
  - Water Framework Directive
authors:
  - name: Robert A Briers
    orcid: 0000-0003-0341-1203
    affiliation: 1
affiliations:
 - name: School of Applied Sciences, Edinburgh Napier University
   index: 1
date: 25 Feburary 2019
bibliography: paper.bib

# Summary

Globally, issues around water quality and quantity are expected to increase in coming decades, set against a background of already widespread degradation [@WWAPUnitedNationsWorldWaterAssessmentProgramme/UN-Water2018]. Within Europe, the [Water Framework Directive](http://ec.europa.eu/environment/water/water-framework/index_en.html) set EU-wide standards for how the quality of surface- and ground-waters across Europe is assessed and classified [@Communities2000]. Assessment of quality using the WFD is based on a range of elements that vary depending on the type of water being assessed. The elements cover biological, chemical and hydromorphological/quantitative components with a hierarchical structure. These are combined to give an overall classification of waterbodies into five classes(High, Good, Moderate, Poor and Bad) for surface waters and two classes (Good or Poor) for groundwaters. The overall aim of the WFD is that all European surface and ground waters will reach at least Good status by 2027, although there have been a number of issues with implementation [@Voulvoulis2017].

In the UK the Environment Agency (EA) is the competent authority responsible for monitoring and assessment of water quality within England. The EA have made the reporting data relating to the rquirements of the WFD available via the Catchment Data Explorer (CDE) website [https://environment.data.gov.uk/catchment-planning/](https://environment.data.gov.uk/catchment-planning/). The cde package for R [@RCoreTeam2018] provides functions that facilitate the querying and download of the data available on the CDE site, allowing efficient collation of data for the analysis of trends or patterns in water quality and pressures on waterbodies across England.

The package contains functions to allow users to search for waterbodies, catchments or River Basin Districts that match given search strings. Having identified the relevant sites, the following types of data can be downloaded:

*Status classification data*: either for overall water body classification or at a range of more detailed levels (e.g. ecological, chemical or priority substances). These can be downloaded for specified year ranges and for specific waterbody types (such as lakes). Summary plots of percentage of water bodies in each status class can also be produced as show below, again for a range of levels, years and waterbody types.

![A plot of status classification data for the Lark Operational Catchment between 2013 and 2015](lark plot-1.png){ width=80% }

*Reasons for Not Achieving Good status*: For catchments or River Basin Districts where there are waterbodies that have not achieved Good status, the package provides the functionality to download a summary of the Reasons for Not Achieving Good (RNAG) data. This gives a range of information regarding the relevant pressures identified as contributing to the current status, classified according to a standard hierarchy given on the CDE website.

*Objectives for waterbodies*: Where less than Good status has been achieved, data on the objectives that have been set in terms of status aimed for in the longer term can be downloaded, for specific target years and for specified levels of classification.

*Measures to achieve objectives*: Details of actions that have been put in place or are proposed to achieve the objectives set (specifically for the target in 2021). Only data linked to the achievement of a specific outcome in terms of status are included.

*Protected areas*: The package also provides a function to download a summary of associated protected areas (such as Special Areas of Conservation or Nitrate Vulnerable Zones), again at a range of levels from individual waterbodies to whole River Basin Districts.


# Acknowledgements

Thanks to Matt Starr of the EA and Dave Reynolds of Epimorphics Ltd for useful discussions about the CDE API and providing a full site listing to help development.

# References