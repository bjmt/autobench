# autobench

## Installation

```r
if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")
remotes::install_github("bjmt/autobench")
```

## Usage

### Code

```r
autobench::begin("results.txt", tool = "bench")

autobench::run("Tests",
               e1 = runif(100000, 0, 10),
               e2 = rnorm(100000, 5, 2.5))

autobench::update(tool = "microbenchmark")
autobench::run("Different tool",
               e1 = runif(100000, 0, 10),
               e2 = rnorm(100000, 5, 2.5))

autobench::update(tool = "rbenchmark", unit = "ms")
autobench::run("Different tool 2",
               e1 = runif(100000, 0, 10),
               e2 = rnorm(100000, 5, 2.5))

autobench::skip()
autobench::run("Skipped tests",
               e1 = sample(1:1000, 1000))

autobench::run("Failing test",
               e1 = 1 + "a")

autobench::end()
```

### Command line output

```
Starting benchmarks
* Running benchmark 1: Tests [0.01 m]
* Running benchmark 2: Different tool [0.02 m]
* Running benchmark 3: Different tool 2 [0.03 m]
* Running benchmark 4: Skipped tests [SKIPPED]
* Running benchmark 6: Failing test [ERROR]
All benchmarks completed.
Total runtime: 0.06 minutes
```

### Text results

```
autobench v0.0.2
2019-03-29 23:44:07

Initial benchmark settings
  * max.reps: 100
  * min.reps: 1
  * min.time: 0.5 seconds
  * check: FALSE
  * tool: bench
  * stop.on.fail: FALSE

>>> Benchmark 1: Tests

e1 = runif(1e+05, 0, 10)
e2 = rnorm(1e+05, 5, 2.5)

Absolute:
expression     min    mean  median     max  itr/sec  mem_alloc  n_gc  n_itr  total_time
----------  ------  ------  ------  ------  -------  ---------  ----  -----  ----------
e1          3.09ms  3.41ms  3.39ms  4.01ms    293.3      784KB     0    100       341ms
e2           7.8ms     8ms  7.96ms  8.62ms    125.0      784KB     0     63       504ms

Relative:
expression    min   mean  median   max  mem_alloc  total_time
----------  -----  -----  ------  ----  ---------  ----------
e1          1.000  1.000   1.000  1.00          1       1.000
e2          2.526  2.345   2.351  2.15          1       1.478

Benchmark runtime: 0.01 minutes

>>> Benchmark 2: Different tool

Updated benchmark settings
  * tool: microbenchmark

e1 = runif(1e+05, 0, 10)
e2 = rnorm(1e+05, 5, 2.5)

Units: milliseconds
expr    min   mean  median    max  neval  cld       mem
----  -----  -----  ------  -----  -----  ---  --------
e1    2.781  3.273   3.295   3.86    100    a  783.8 Kb
e2    7.324  7.969   7.823  24.56    100    b  783.8 Kb

Units: relative
expr    min   mean  median    max  neval  cld  mem
----  -----  -----  ------  -----  -----  ---  ---
e1    1.000  1.000   1.000  1.000    100    a    1
e2    2.634  2.435   2.375  6.363    100    b    1

Benchmark runtime: 0.02 minutes

>>> Benchmark 3: Different tool 2

Updated benchmark settings
  * unit: ms
  * tool: rbenchmark

e1 = runif(1e+05, 0, 10)
e2 = rnorm(1e+05, 5, 2.5)

Units: milliseconds
test  elapsed  relative  replications  per.rep       mem  rel.mem
----  -------  --------  ------------  -------  --------  -------
e1        321     1.000           100     3.21  783.8 Kb        1
e2        779     2.427           100     7.79  783.8 Kb        1

Benchmark runtime: 0.03 minutes

>>> Benchmark 4: Skipped tests [SKIPPED]

>>> Benchmark 5: Failing test [ERROR]

>>> All benchmarks complete.

Total runtime: 0.06 minutes

─ Session info ───────────────────────────────────────────────────────────────────────────────────
 setting  value                       
 version  R version 3.5.3 (2019-03-11)
 os       macOS High Sierra 10.13.4   
 system   x86_64, darwin15.6.0        
 ui       X11                         
 language (EN)                        
 collate  fr_CA.UTF-8                 
 ctype    fr_CA.UTF-8                 
 tz       America/Toronto             
 date     2019-03-29                  

─ Packages ───────────────────────────────────────────────────────────────────────────────────────
 !  package        * version    date       lib source                            
    assertthat       0.2.1      2019-03-21 [1] CRAN (R 3.5.3)                    
 VP autobench      * 0.0.2      2019-03-30 [?] Github (bjmt/autobench@823d7d5)   
    backports        1.1.3      2018-12-14 [1] CRAN (R 3.5.0)                    
    bench            1.0.1      2018-06-06 [1] CRAN (R 3.5.0)                    
    bit              1.1-14     2018-05-29 [1] CRAN (R 3.5.0)                    
    bit64            0.9-7      2017-05-08 [1] CRAN (R 3.5.0)                    
    blob             1.1.1      2018-03-25 [1] CRAN (R 3.5.0)                    
    broom            0.5.1      2018-12-05 [1] CRAN (R 3.5.0)                    
    callr            3.2.0      2019-03-15 [1] CRAN (R 3.5.2)                    
    cellranger       1.1.0      2016-07-27 [1] CRAN (R 3.5.0)                    
    cli              1.1.0      2019-03-19 [1] CRAN (R 3.5.2)                    
    clisymbols       1.2.0      2017-05-21 [1] CRAN (R 3.5.0)                    
    codetools        0.2-16     2018-12-24 [2] CRAN (R 3.5.3)                    
    colorout       * 1.2-0      2019-02-12 [1] Github (jalvesaq/colorout@cc5fbfa)
    colorspace       1.4-1      2019-03-18 [1] CRAN (R 3.5.2)                    
    commonmark       1.7        2018-12-01 [1] CRAN (R 3.5.0)                    
    crancache        0.0.0.9000 2019-02-09 [1] Github (r-lib/crancache@6a288af)  
    cranlike         1.0.2      2018-11-26 [1] CRAN (R 3.5.0)                    
    crayon           1.3.4      2017-09-16 [1] CRAN (R 3.5.0)                    
    curl             3.3        2019-01-10 [1] CRAN (R 3.5.2)                    
    DBI              1.0.0      2018-05-02 [1] CRAN (R 3.5.0)                    
    debugme          1.1.0      2017-10-22 [1] CRAN (R 3.5.0)                    
    desc             1.2.0      2018-05-01 [1] CRAN (R 3.5.0)                    
    devtools       * 2.0.1      2018-10-26 [1] CRAN (R 3.5.2)                    
    digest           0.6.18     2018-10-10 [1] CRAN (R 3.5.0)                    
    dplyr          * 0.8.0.1    2019-02-15 [1] CRAN (R 3.5.2)                    
    fansi            0.4.0      2018-10-05 [1] CRAN (R 3.5.1)                    
    forcats        * 0.4.0      2019-02-17 [1] CRAN (R 3.5.2)                    
    fs               1.2.7      2019-03-19 [1] CRAN (R 3.5.3)                    
    generics         0.0.2      2018-11-29 [1] CRAN (R 3.5.0)                    
    ggplot2        * 3.1.0      2018-10-25 [1] CRAN (R 3.5.0)                    
    git2r            0.25.2     2019-03-19 [1] CRAN (R 3.5.3)                    
    glue             1.3.1      2019-03-12 [1] CRAN (R 3.5.2)                    
    gtable           0.3.0      2019-03-25 [1] CRAN (R 3.5.3)                    
    haven            2.1.0      2019-02-19 [1] CRAN (R 3.5.2)                    
    highr            0.8        2019-03-20 [1] CRAN (R 3.5.3)                    
    hms              0.4.2      2018-03-10 [1] CRAN (R 3.5.0)                    
    httr             1.4.0      2018-12-11 [1] CRAN (R 3.5.0)                    
    jsonlite         1.6        2018-12-07 [1] CRAN (R 3.5.0)                    
    knitr            1.22       2019-03-08 [1] CRAN (R 3.5.2)                    
    lattice          0.20-38    2018-11-04 [2] CRAN (R 3.5.3)                    
    lazyeval         0.2.2      2019-03-15 [1] CRAN (R 3.5.2)                    
    lubridate        1.7.4      2018-04-11 [1] CRAN (R 3.5.0)                    
    magrittr         1.5        2014-11-22 [1] CRAN (R 3.5.0)                    
 R  MASS             7.3-51.1   <NA>       [2] <NA>                              
 R  Matrix           1.2-16     <NA>       [2] <NA>                              
    memoise          1.1.0      2017-04-21 [1] CRAN (R 3.5.0)                    
    microbenchmark * 1.4-6      2018-10-18 [1] CRAN (R 3.5.0)                    
    modelr           0.1.4      2019-02-18 [1] CRAN (R 3.5.2)                    
    multcomp         1.4-10     2019-03-05 [1] CRAN (R 3.5.2)                    
    munsell          0.5.0      2018-06-12 [1] CRAN (R 3.5.0)                    
    mvtnorm          1.0-10     2019-03-05 [1] CRAN (R 3.5.2)                    
 R  nlme             3.1-137    <NA>       [2] <NA>                              
    nvimcom        * 0.9-81     2019-03-21 [1] local                             
    pacman         * 0.5.1      2019-03-11 [1] CRAN (R 3.5.2)                    
    parsedate        1.1.3      2017-03-02 [1] CRAN (R 3.5.0)                    
    pillar           1.3.1      2018-12-15 [1] CRAN (R 3.5.0)                    
    pkgbuild         1.0.3      2019-03-20 [1] CRAN (R 3.5.3)                    
    pkgconfig        2.0.2      2018-08-16 [1] CRAN (R 3.5.0)                    
    pkgload          1.0.2      2018-10-29 [1] CRAN (R 3.5.0)                    
    plyr             1.8.4      2016-06-08 [1] CRAN (R 3.5.0)                    
    prettyunits      1.0.2      2015-07-13 [1] CRAN (R 3.5.0)                    
    processx         3.3.0      2019-03-10 [1] CRAN (R 3.5.2)                    
    profmem          0.5.0      2018-01-30 [1] CRAN (R 3.5.0)                    
    pryr             0.1.4      2018-02-18 [1] CRAN (R 3.5.0)                    
    ps               1.3.0      2018-12-21 [1] CRAN (R 3.5.0)                    
    purrr          * 0.3.2      2019-03-15 [1] CRAN (R 3.5.2)                    
    R6               2.4.0      2019-02-14 [1] CRAN (R 3.5.2)                    
    rappdirs         0.3.1      2016-03-28 [1] CRAN (R 3.5.0)                    
    rbenchmark       1.0.0      2012-08-30 [1] CRAN (R 3.5.0)                    
    rcmdcheck        1.3.2      2018-11-10 [1] CRAN (R 3.5.0)                    
    Rcpp             1.0.1      2019-03-17 [1] CRAN (R 3.5.2)                    
    readr          * 1.3.1      2018-12-21 [1] CRAN (R 3.5.0)                    
    readxl           1.3.1      2019-03-13 [1] CRAN (R 3.5.2)                    
    remotes          2.0.2      2018-10-30 [1] CRAN (R 3.5.0)                    
    rlang            0.3.2      2019-03-21 [1] CRAN (R 3.5.3)                    
    roxygen2         6.1.1      2018-11-07 [1] CRAN (R 3.5.0)                    
    rprojroot        1.3-2      2018-01-03 [1] CRAN (R 3.5.0)                    
    RSQLite          2.1.1      2018-05-06 [1] CRAN (R 3.5.0)                    
    rstudioapi       0.10       2019-03-19 [1] CRAN (R 3.5.3)                    
    rvest            0.3.2      2016-06-17 [1] CRAN (R 3.5.0)                    
    sandwich         2.5-0      2018-08-17 [1] CRAN (R 3.5.0)                    
    scales           1.0.0      2018-08-09 [1] CRAN (R 3.5.0)                    
    sessioninfo      1.1.1      2018-11-05 [1] CRAN (R 3.5.0)                    
    stringi          1.4.3      2019-03-12 [1] CRAN (R 3.5.2)                    
    stringr        * 1.4.0      2019-02-10 [1] CRAN (R 3.5.2)                    
 R  survival         2.43-3     <NA>       [2] <NA>                              
    testthat         2.0.1      2018-10-13 [1] CRAN (R 3.5.0)                    
    TH.data          1.0-10     2019-01-21 [1] CRAN (R 3.5.2)                    
    tibble         * 2.1.1      2019-03-16 [1] CRAN (R 3.5.2)                    
    tictoc         * 1.0        2014-06-17 [1] CRAN (R 3.5.0)                    
    tidyr          * 0.8.3      2019-03-01 [1] CRAN (R 3.5.2)                    
    tidyselect       0.2.5      2018-10-11 [1] CRAN (R 3.5.0)                    
    tidyverse      * 1.2.1      2017-11-14 [1] CRAN (R 3.5.0)                    
    usethis        * 1.4.0.9000 2019-03-22 [1] Github (r-lib/usethis@ef3d8bf)    
    utf8             1.1.4      2018-05-24 [1] CRAN (R 3.5.0)                    
    whisker          0.3-2      2013-04-28 [1] CRAN (R 3.5.0)                    
    withr            2.1.2      2018-03-15 [1] CRAN (R 3.5.0)                    
    xfun             0.5        2019-02-20 [1] CRAN (R 3.5.2)                    
    xml2             1.2.0      2018-01-24 [1] CRAN (R 3.5.0)                    
    xopen            1.0.0      2018-09-17 [1] CRAN (R 3.5.1)                    
    zoo              1.8-5      2019-03-21 [1] CRAN (R 3.5.3)                    

[1] /Users/Ben/R_lib
[2] /Library/Frameworks/R.framework/Versions/3.5/Resources/library

 V ── Loaded and on-disk version mismatch.
 P ── Loaded and on-disk path mismatch.
 R ── Package was removed from disk.
```
