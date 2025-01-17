# ctrdata 1.15.2.9000 (2023-10-06)
 - ensure `dbFindFields()` return fields for EU and 3rd country trials in EUCTR, updated documentation
 - potentially breaking changes for EUCTR, fields renamed to harmonise EU and 3rd country trials: 
   new: "e83_single_site_trial", was: "e83_the_trial_involves_single_site_ in_the_member_state_concerned"
   new: "e83_single_site_trial", was: "e83_will_this_trial_be_conducted_ at_a_single_site_globally"
   new: "e84_multiple_sites_in_member_state", was "e84_the_trial_involves_multiple_sites_ in_the_member_state_concerned"
   new: "e840_multiple_sites_globally", was "e84_will_this_trial_be_conducted_ at_multiple_sites_globally"
   new: "e863_trial_sites_planned_in", was "e863_specify_the_regions_in_which_ trial_sites_are_planned"
   new: "e863_trial_sites_planned_in", was "e863_specify_the_countries_outside_ of_the_eea_in_which_ trial_sites_are_planned"
 
# ctrdata 1.15.2 (2023-09-10)
 - fix handling as utf8 upstream multi-language strings from CTIS
 - correct creating lists for downloading documents for ctis
 - adding missing endpoints for CTIS found with increasing amount of data, 
   e.g. publicevents.temporaryHaltList.details for 2022-501559-99-00

# ctrdata 1.15.1 (2023-08-29)
 - correct LaTeX documentation resulting in CRAN error
 - correct parts of downloading from `CTIS`, including file name sanitisation
 
# ctrdata 1.15.0 (2023-08-27)
 - added CTGOV REST API 2.0.0.-test as new register with identifier `CTGOV2`
 - handle CTGOV classic interface as register `CTGOV` 
 - improved `ctrdataURLcopier.js` to only rewrite searches and views from `CTIS`
 - mangle CTIS: change `partIIInfo` object into array, adding a new `partIIIinfoKey` so that `'{"partIIInfo": "<int>": {...}, "<int>": {...}}'` becomes `'{"partIIInfo": [{"partIIIinfoKey": <int>, ...}, {"partIIIinfoKey": <int>, ...}]}')`
 - correct dbGetFieldsIntoDf() for specific lists

# ctrdata 1.14.0 (2023-07-16)
 - fix `dbFindIdsUniqueTrials()` for single-record register contents
 - expand number of CTIS variables that are typed as date
 - `dfMergeVariablesRelevel()` superseeds `dfMergeTwoVariablesRelevel()`
 
# ctrdata 1.13.3 (2023-06-24)
 - typo in `dbFindFields()`
 - use only CTGOV classic website (ctrdata is being adapted to new website)
 - correct missing names and attributes on return vector of `dbFindIdsUniqueTrials()`
 
# ctrdata 1.13.2 (2023-05-27)
 - correct selection of lists with ids for documents to download from CTIS
 - reduce dependencies (rvest, dplyr removed)
 
# ctrdata 1.13.1 (2023-05-07)
 - load more CTIS data (publicEvaluation) and download documents
 - integrate downloading documents into ctrLoadQueryIntoDb() also for CTGOV
 - use documents.path for CTGOV, EUCTR, CTIS; deprecated euctrresultsfilespath
 - added documents.regexp to select documents for downloading based on their file name
 
# ctrdata 1.13.0 (2023-04-23)
 - data from CTIS is imported more completely
 - adapt other functions to accommodate CTIS
 - provide Tampermonkey script to get the URL of a user's query in a register 
 - speed up `ctrLoadQueryIntoDb()` for CTIS with nodbi >=0.9.2.9000
 - keep register names on vector returned by `dbFindIdsUniqueTrials()`
 - correct `dbFindFields()` for EUCTR
 
# ctrdata 1.12.1 (2023-03-29)
 - fix escaping hash symbol in PDF rendition of an help page
 - fix file encoding for CTIS downloads under MS Windows
 
# ctrdata 1.12.0 (2023-03-25)
 - added first access to new register: CTIS, the EU Clinical Trial Information System
 - stop (instead of warning) if register host errors (e.g. incorrect number of records)
 - switch to use `curl::multi_download()` which can resume retrievals from registers
 - require curl >= 5.0
 
# ctrdata 1.11.1 (2022-11-20)
 - cater for very short EUCTR results-related information
 - show warning as beta CTGOV website is not supported
 - limit unit testing to MongoDB and SQLite
 - return error for ctrGetQueryUrl() if no query URL
 - prevent re-using connections to reduce http/2 layer errors
 - update query history when querytoupdate was used but no new records found
 - make `ctrLoadQueryIntoDb()` to always return visible result
 - correct `dfTrials2Long()` identifier (EUCTR no more top "1" across fields)
 - correct non-ASCII characters
 
# ctrdata 1.11.0 (2022-11-02)
 - now works with DuckDB (>= v0.6.0) as database backend, using nodbi (>= v0.9.0)
 - reduced default number of parallel connections to EUCTR from 10 to 4
 
# ctrdata 1.10.2 (2022-08-20)
 - fix slow speed in `dfName2Value()`
 - fix to remove row names from `dfName2Value()`
 - fix for internal function to handle tibble
 - fix for handling certain ISRCTN queries
 - fix `dbGetFieldsIntoDf()` with missing data
 - fix timeouts and methods in package testing
 - fix `dbGetFieldsIntoDf()` for rare complex fields
 - fix URL in Rd file
 - make examples runnable with demo database
 - include `wherevalue` in `dfName2Value()` result
 
# ctrdata 1.10.1 (2022-07-24)
 - fix documentation issues (https://stat.ethz.ch/pipermail/r-package-devel/2022q3/008240.html)
 - fix unit test with unused but missing argument
 - fix GitHub actions and tests
 
# ctrdata 1.10.0 (2022-07-01)
 - `ctrLoadQueryIntoDb()` new parameter `euctrresultsfilespath`, deprecating `euctrresultspdfpath`
 - `ctrLoadQueryIntoDb()` now also extracts and saves results files other than PDF files
 - `ctrFindActiveSubstanceSynonyms()` returns NULL for non-existing active substance
 
# ctrdata 1.9.1 (2022-04-24)
 - type e811... variables
 - bugfix in dbGetFieldsIntoDf
 - bugfix annotations mix up for some backends
 - editorial update vignettes
 
# ctrdata 1.9.0 (2022-03-13)
 - chunked trial batches in ndjson files for accelerated database import
 - if package dplyr is loaded, functions return a tibble instead of a data frame
 - update and correct documentation
 - `dbFindFields()` returns a vector of fields which now has as names the register in which a field occurs
 - accelerated binary checks (cygwin / Windows)
 - remove internet proxy mangling in order to use system configuration (e.g., transparent proxies used, or environment variable https_proxy specified by user)
 - refactored internal caching
 - correct `dbGetFieldsIntoDf()` for specific nested data structures
 - correct `dfTrials2Long()` for specific fields
 - correct `dbFindIdsUniqueTrials()` when only single trial in any register
 - modify field typing to decode HTML entities
 - type some fields as difftime, e.g. `min_age` in CTGOV
 - speed up parts of `dbGetFieldsIntoDf()` and simplify more fields
 - `dbFindFields()` returns names of all leaf and node fields
 - improve and update documentation
 - changed EU Member State to default to DE for dbFindIdsUniqueTrials()
 - corrected `installCygwinWindowsDoInstall()` to properly update an installation (remove --prune-install)
 - test all binaries after `installCygwinWindowsDoInstall()` and only cache successful binary testing
 - correct typing `required_header.download_date`
 - improve numbering in `dfTrials2Long()`, covering nested items

# ctrdata 1.8.0.9001 (2021-12-11)
 - thorough documentation improvement
 - simplified `dbFindFields()`
 - cleaned up testing binaries
 - cleaned up helper scripts
 - removed `ctrGetQueryUrlFromBrowser()`, long deprecated
 
# ctrdata 1.8.0.9000 (2021-11-22)
 - uses nodbi 0.6.0
 - can use PostgreSQL as backend
 - include PostgreSQL in Github Actions
 
# ctrdata 1.8.0 (2021-11-18)
 - changes to match nodbi 0.5.0 
 - simplifying database operations (user-visible functions: 
   ctrLoadQueryIntoDb, dbFindIdsUniqueTrials, dbGetFieldsIntoDf), 
   without changes to API

# ctrdata 1.7.1.9000 (2021-08-23)
 - new development version

# ctrdata 1.7.1 (2021-08-22)
 - fix DBI not needed in Imports anymore (CRAN Note)
 - fix potential file name issue in conversion script
 - fix dbFindFields() to never return _id (previously depended on database backend)
 - changed tests (not on CRAN detection, register availability, additional tests)

# ctrdata 1.7.0 (2021-07-24)
 - much reduced database backend-specific code, using nodbi 0.4.3 (released 2021-07-23)
   which also introduces transactions for sqlite using RSQLite >=2.2.4 (released 2021-03-12)
 - temporary directory creation only when needed, more automated deletion
 - changes in detecting non-functioning register servers
 - further streamlined unit testing

# ctrdata 1.6.0 (2021-05-09)
 - added support for ISRCTN
 - refactored checking binaries and caching this info 
 - updated EUCTR download parameters
 - refactored ctrGetQueryUrl and ctrOpenSearchPagesInBrowser
 - harmonised error checking
 - avoid some errors with external scripts
 - refactored url / query mangling, added detailed testing
 - refactored storing JSON into database (handle big files, reduce memory)
 - improved dbFindIdsUniqueTrials (speed, memory, register coverage)
 - factored out conversion to JSON
 - accelerated EUCTR results and history download and storage
 - external scripts now create multiple chunks of records
 - use further identifier fields with dbFindIdsUniqueTrials

# ctrdata 1.5.3.9000 (2021-04-29)
 - adding user info which field entries could not be typed

# ctrdata 1.5.3 (2021-04-19)
 - include message how to handle server certificate issues,
   by propagating user settings for httr to curl operations
 - ensure identical return structures when no new trials found
 - dfTrials2Long: harmonise identifier level assignment, 
   address cases where field occurs only once in input df
 - dfMergeTwoVariablesRelevel: corrected and improved user info
 - dfName2Value: remove duplicate rows, e.g. from duplicated criteria
 
# ctrdata 1.5.2 (2021-04-05)
 - bugfix of EOL for converting EUCTR files

# ctrdata 1.5.1 (2021-03-21)
 - bugfix for non-matching euctr protocol and result ids: 
   any trials from EUCTR for which results were downloaded with 
   version 1.5.0 should be downloaded again (ctrLoadQueryIntoDb)
 - dfTrials2Long refactored and accelerated
 - API change: dfTrials2Long return value (identifier replaces main_id and sub_id) 
 - new option to save EUCTR results PDF files in user-specified directory
 
# ctrdata 1.5.0 (2021-03-14)
 - return values of dbGetFieldsIntoDf are now mostly 
   identical whether using src_mongo or src_sqlite,
   to best ensure portability of analysis code
 - permit dots in queries / URLs
 - improved handling of queryterm
 - renamed ctrGetQueryUrlFromBrowser to ctrGetQueryUrl
 - soft deprecated ctrGetQueryUrlFromBrowser
 - ensure parallel retrievals from EUCTR
 - speed up routines in dbGetFieldsIntoDf
 - make dfTrials2Long handle NA better
 - improved documentation, clarified examples
 - simplified internals for typing fields, 
   start typing results fields

# ctrdata 1.4.1 (2020-11-03)
 - reset row names on data frames returned by functions
 - update curl parameters when accessing EUCTR

# ctrdata 1.4 (2020-10-17)
 - new: easy access to variables with
   dfTrials2Long() + dfName2Value()
 - improved dfMergeTwoVariablesRelevel() 
   to maintain type of data
 - revised and simplified vignettes
 - deprecated: dfListExtractKey()
 - refactored parts of euctr retrieval
 - notify user when euctr register server
   does not permit compression and how 
   long retrieval will take

# ctrdata 1.3.2.9000 (2020-10-08)
 - fixed identifying unique ids

# ctrdata 1.3.2 (2020-10-03)
 - quote system file paths

# ctrdata 1.3.1 (2020-08-01)
 - fix error in CI tests

# ctrdata 1.3.0 (2020-07-27)
 - workaround EUCTR certificate issue
 - streamline ctrGetQueryUrlFromBrowser()
 - better handling of complex fields
 - include further tests for query string handling,
   checking more parameters and return values
 - better clean-up after testing
 - ctrLoadQueryIntoDb(querytorerun = ...) now looks
   for the date when the querytorerun was last run, 
   to more often use euctr update options
 - switching from travis to github action
 - upped coverage of code tested
 
# ctrdata 1.2.1 (2020-05-18)
 - tinytest >= 1.2.1 to avoid regression error
 - correct testing detail

# ctrdata 1.2 (2019-12-07)
 - correct cygwin install detail

# ctrdata 1.1 (2019-11-12)
 - release after nodbi 0.4 is available

# ctrdata 1.0.1.9005 (2019-11-09)
 - update description for installation from github
 
# ctrdata 1.0.1.9004 (2019-11-04)
 - handled mixed arrays and text values in same key of ctgov trial records
 - more user information during importing
 
# ctrdata 1.0.1.9003 (2019-11-04)
 - further nesting added for euctr trial records
 - user verbose information extended for record importing
 
# ctrdata 1.0.1.9002 (2019-11-03)
 - improved parsing of euctr trial records
 - correct re-opening of sqlite connection
 
# ctrdata 1.0.1 (2019-10-22)
 - correction of testing

# ctrdata 1.0 (2019-10-16)
 - switch to nodbi::scr_{mongo,sqlite}() with 
   re-implementation of most functions
 - switch from testthat to tinytest, so that users 
   can check with tinytest::test_package("ctrdata")
 - improvements to euctr trial import  
 - new function dfListExtractKey

# ctrdata 0.18.9005 (2019-05-02)
 - speed up testing bash commands under windows

# ctrdata 0.18.2 (2019-04-30)
 - new release
 - extended compatibility with cygwin and Windows
 
# ctrdata 0.18.9004 (2019-04-28)
 - find and use any cygw* under windows
 - refactored escaping bash command when called under windows

# ctrdata 0.18.9002 (2019-04-21)
 - corrected typing date fields

# ctrdata 0.18.1 (2019-04-14)
 - simplified cygwin install
 - updated documentation
 - corrected inconsistent handling of query terms

# ctrdata 0.18.9001 (2019-04-12)
 - added automated proxy handling

# ctrdata 0.18 (2019-04-11)
 - release version
 - bug fixes in field typing
 - move to use remote mongodb server
 - updated vignettes
 
# ctrdata 0.17 (2019-03-27)
 - release version
 
# ctrdata 0.16.9002 (2019-03-26)
 - improve dbFindFields() formatting
 - added parameter to force running a query again
   
# ctrdata 0.16.9001 (2019-03-26
 - added further typing (some of the numeric fields)
 - improve cygwin install attempts and information
   
# ctrdata 0.16.9000 (2019-03-24)
 - removed dependency on local mongodb installation (major rewrite)
 - improved support for remote mongodb servers (note changes in host / db / uri parameters)
   
# ctrdata 0.15.9007 (2019-03-15)
 - Important: Added no checking of SSL certificates for EUCTR because the EUCTR server is
   not sending the required intermediate and root certificates, thus failing curl and httr, see
   https://www.digicert.com/help/?host=www.clinicaltrialsregister.eu

# ctrdata 0.15.0 (2019-03-13)
 - fixed EUCTR results retrieval (curl return value order not predictable)
 - removed second time adding metadata in one function
 - streamlined user information and progress feedback

# ctrdata 0.14.3 (2019-03-12)
 - turned error into message when no new trials are found
 - prevent failing tests if no new trials found in rss feed
 
# ctrdata 0.14.2 (2019-03-07)
 - harmonise user information
 
# ctrdata 0.14.1 (2019-03-07)
 - replaced RCurl (which failed for some register servers) by httr and curl
 - create README.md from README.Rmd

# ctrdata 0.14 (2019-03-06)
 - intention to submit to CRAN, therefore changing several warnings to messages, improve testing of tool chain applications
 
# ctrdata 0.13.3 (2019-03-03)
 - prettified dbFindFields() by removing count symbols (XX.) from paths
 - improve converting of invalid XML from EUCTR result files to JSON
 
# ctrdata 0.13.2 (2019-02-28)
 - made EUCTR retrieval more robust
 - added marginal case for url of single trial in EUCTR
 - extended timeout for checking online status of EUCTR
 
# ctrdata 0.13.1 (2019-02-24)
 - added typing of dates and some logical fields when using dbGetFieldsIntoDf()

# ctrdata 0.13 (2019-01-06)
 - dbGetVariablesIntoDf() is deprecated, use dbGetFieldsIntoDf() instead
 - dbFindVariable() is deprecated, use dbFindFields() instead
 - in dbMergeTwoVariablesRelevel() parameter varnames is deprecated, use colnames instead
 
# ctrdata 0.12.1 (2018-12-15)
 - added function ctrFindActiveSubstanceSynonyms() to obtain synonyms for an active substance
 - added user information on number of trials in CTGOV to be downloaded, and limit this to 5000 per query
 - corrected import from EUCTR for details = FALSE
   
# ctrdata 0.12 (2018-05-19)
 - added possibility to add user's annotations to records retrieved with a query (new option annotate.text)
   
# ctrdata 0.11.2 (2018-04-22)
 - changed queryterm processing
   
# ctrdata 0.11.1 (2018-04-07)
 - improved installFindMongoBinaries(), 
   should now better detect mongo binary locations and use 
   for example in cron scripts, which may not have access 
   to a user's path information

# ctrdata 0.11 (2018-01-28)
 - newly retrieved: EUCTR results history, into new fields 
   "firstreceived_results_date" and "version_results_history"
 - adding feature as per issue #8

# ctrdata 0.10.4 (2017-12-28)
 - note on compatibility with mongoDB versions
 - fixing issue #8
 - simplified license
 
## ctrdata 0.10.3 (2017-11-24)
 - changed custom-built "x5_trial_status" to "p_end_of_trial_status" provided by EUCTR
 
# ctrdata 0.10.2 (2017-11-22)
 - editorial project updates
 
# ctrdata 0.10.1 (2017-07-30)
 - now loading results from euctr where available as xml
 
# ctrdata 0.10.0 (2017-07-25)
 - fully load results from ctgov
 - prepare loading results from euctr
 
# ctrdata 0.9.14 (2017-06-28)
 - refactored system calls
 - windows now part of continuous integration
 
# ctrdata 0.9.13 (2017-06-23)
 - refactored ctrLoadQueryIntoDb
 
# ctrdata 0.9.12 (2017-06-18)
 - Preparing for new CTGOV interface
 - Improved documentation
 - Corrected ctrGetQueryUrlFromBrowser return value

# ctrdata 0.9.11.1 (2017-02-04)
 - Improved documentation

# ctrdata 0.9.11 (2017-01-15)
 - Added functionality: EUCTR fallback import mechanism if large JSON file fails to import into mongoDB (by splitting and importing one JSON file for each trial, tested with several thousand trials)

# ctrdata 0.9.10.1 (2017-01-12)
 - Fixes issues with conversion of EUCTR records that did not have details.
 - Fixes issue that placebo information was converted into IMP fields. 
 
# ctrdata 0.9.10.0 (2016-12-28)
 - Added metadata attributes to returned objects to indicate database, query, timestamp etc.
 
# ctrdata 0.9.9.5 (2016-12-14)
 - Added option ctrLoadQueryIntoDb(querytoupdate = "last") to re-download last query in collection
 
# ctrdata 0.9.9.4 (2016-11-18)
 - Added progress indicator to ctrLoadQueryIntoDb() to indicate network download traffic
 
# ctrdata 0.9.9.3 (2016-11-17)
 - deduplication in dbFindIdsUniqueTrials() optimised for speed and memory, added check by ISRCTN

# ctrdata 0.9.9.2 (2016-11-13)
 - corrected deduplication in dbFindIdsUniqueTrials()

# ctrdata 0.9.9.1 (2016-11-12)
 - renamed ctrQueryHistoryInDb() to dbQueryHistory()
 - note: change in json format of query history, breaking compatibility
 - refactored all concerned functions to use mongolite
 - rmongodb is no more supported

# ctrdata 0.9 (2016-10-17)
 - changed implementation of dbFindIdsUniqueTrials()
 - editorial changes to examples

# ctrdata 0.8.1 (2016-09-07)
 - added field to indicate source register
 - improved ctrLoadQueryIntoDb() with details = FALSE
 - added example for map plotting

# ctrdata 0.8 (2016-09-04)
 - dbFindIdsUniqueTrials now encapsulates dfFindIdsUniqueEuctrRecord
 - dfFindIdsUniqueEuctrRecords removed
 - installation instructions updated after recently rmongodb was removed from CRAN

# ctrdata 0.7 (2016-05-29)
 - dbGetVariablesIntoDf changed to concatenate values in array and objects 
 - completed test adaptation for travis
 - improving perl regex
 - checking helper applications

# ctrdata 0.6.2 (2016-04-20)
 - add / update field "record_last_import" for every imported / updated record

# ctrdata 0.6.1 (2016-04-02)
 - changed to provide vignettes

# ctrdata 0.6 (2016-02-25)
 - different update mechanism for EUCTR implemented
 - corrected function name from db... to dfFindUniqueEuctrRecord()

# ctrdata 0.5.9 (2016-01-23)
 - Corrected bugs
 - Started preparation of submission to CRAN
 - Preparing to include package unit tests

# ctrdata 0.5 (2015-11-29)
 - Published on github
 - Improved documentation

# ctrdata 0.4 (2015-10-08)
 - Renamed all functions for consistency and ease-of-use

# ctrdata 0.3 (2015-10-06)
 - Added functionality to download xml data from CTGOV, which includes more data than the csv format

# ctrdata 0.2.8
 - Changed and extended how history of queries is included in database.
 - New function dbCTRQueryHistory()

# ctrdata 0.2.7
 - Added function for merging variables such as from different registers and optionally to merge values into new values
 - Note that function findCTRkey was renamed to dbFindCTRkey because it acts on the database

# ctrdata 0.2.5
 - Added function for selecting preferred language versions of trials from EUCTR
 - Improved use of automatic proxy configuration script

# ctrdata 0.2.2
 - Added proxy function and improved installation of cygwin under MS Windows

# ctrdata 0.2 (2015-09-19)
 - Now also working on MS Windows

# ctrdata 0.1 (2015-09-15)
 - First version with basic functionality
 - Limited testing
 - Works on Mac OS X (10.10.x)
