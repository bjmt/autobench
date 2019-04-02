# Example markdown output

autobench v1.0.0

2019-04-01 23:18:26

## Initial benchmark settings
  * tool: bench
  * max.reps: 100
  * min.reps: 1
  * min.time: 0.5 seconds
  * check: FALSE
  * stop.on.fail: FALSE

## Benchmark 1: Tests

* Benchmark runtime: 0.9 seconds

```r
e1 = runif(1e+05, 0, 10)
e2 = rnorm(1e+05, 5, 2.5)
```

### Absolute:
|expression|   min|  mean|median|   max|itr/sec|mem_alloc|n_gc|n_itr|total_time|
|:---------|-----:|-----:|-----:|-----:|------:|--------:|---:|----:|---------:|
|`e1`      |2.93ms|3.41ms|3.42ms|4.89ms|  293.3|    784KB|   2|   98|     334ms|
|`e2`      |7.35ms|8.13ms| 8.1ms|9.52ms|  123.0|    784KB|   2|   59|     480ms|

### Relative:
|expression|  min| mean|median|  max|mem_alloc|total_time|
|:---------|----:|----:|-----:|----:|--------:|---------:|
|`e1`      |1.000|1.000| 1.000|1.000|        1|     1.000|
|`e2`      |2.507|2.384| 2.364|1.949|        1|     1.435|

## Benchmark 2: Different tool

* Benchmark runtime: 1.4 seconds

### Updated benchmark settings
  * tool: microbenchmark

```r
e1 = runif(1e+05, 0, 10)
e2 = rnorm(1e+05, 5, 2.5)
```

### Units: milliseconds
|expr|  min| mean|median|   max|neval|cld|     mem|
|:---|----:|----:|-----:|-----:|----:|--:|-------:|
|`e1`|2.928|3.454| 3.425| 9.137|  100|  a|783.8 Kb|
|`e2`|7.321|8.343| 8.060|13.706|  100|  b|783.8 Kb|

### Units: relative
|expr|min| mean|median|max|neval|cld|mem|
|:---|--:|----:|-----:|--:|----:|--:|--:|
|`e1`|1.0|1.000| 1.000|1.0|  100|  a|  1|
|`e2`|2.5|2.416| 2.353|1.5|  100|  b|  1|

## Benchmark 3: Different tool 2

* Benchmark runtime: 1.7 seconds

### Updated benchmark settings
  * unit: ms
  * tool: rbenchmark

```r
e1 = runif(1e+05, 0, 10)
e2 = rnorm(1e+05, 5, 2.5)
```

### Units: milliseconds
|test|elapsed|relative|replications|per.rep|     mem|rel.mem|
|:---|------:|-------:|-----------:|------:|-------:|------:|
|`e1`|    502|   1.000|         100|   5.02|783.8 Kb|      1|
|`e2`|    843|   1.679|         100|   8.43|783.8 Kb|      1|

## Benchmark 4: Skipped tests [SKIPPED]

## Some notes

* Bullet point 1

* Bullet point 2

## Benchmark 5: Failing test [ERROR]

Error: argument non numérique pour un opérateur binaire

## All benchmarks complete

* Total runtime: 4.1 seconds

```
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
 date     2019-04-01                  

─ Packages ───────────────────────────────────────────────────────────────────────────────────────
 ! package        * version    date       lib source                            
   assertthat       0.2.1      2019-03-21 [1] CRAN (R 3.5.3)                    
 P autobench      * 1.0.0      2019-04-01 [?] Github (bjmt/autobench@1e552d4)   
   backports        1.1.3      2018-12-14 [1] CRAN (R 3.5.0)                    
   bench            1.0.1      2018-06-06 [1] CRAN (R 3.5.0)                    
   broom            0.5.1      2018-12-05 [1] CRAN (R 3.5.0)                    
   callr            3.2.0      2019-03-15 [1] CRAN (R 3.5.2)                    
   cellranger       1.1.0      2016-07-27 [1] CRAN (R 3.5.0)                    
   cli              1.1.0      2019-03-19 [1] CRAN (R 3.5.2)                    
   codetools        0.2-16     2018-12-24 [2] CRAN (R 3.5.3)                    
   colorout       * 1.2-0      2019-02-12 [1] Github (jalvesaq/colorout@cc5fbfa)
   colorspace       1.4-1      2019-03-18 [1] CRAN (R 3.5.2)                    
   commonmark       1.7        2018-12-01 [1] CRAN (R 3.5.0)                    
   crayon           1.3.4      2017-09-16 [1] CRAN (R 3.5.0)                    
   desc             1.2.0      2018-05-01 [1] CRAN (R 3.5.0)                    
   devtools       * 2.0.1      2018-10-26 [1] CRAN (R 3.5.2)                    
   digest           0.6.18     2018-10-10 [1] CRAN (R 3.5.0)                    
   dplyr          * 0.8.0.1    2019-02-15 [1] CRAN (R 3.5.2)                    
   forcats        * 0.4.0      2019-02-17 [1] CRAN (R 3.5.2)                    
   fs               1.2.7      2019-03-19 [1] CRAN (R 3.5.3)                    
   generics         0.0.2      2018-11-29 [1] CRAN (R 3.5.0)                    
   ggplot2        * 3.1.0      2018-10-25 [1] CRAN (R 3.5.0)                    
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
 R MASS             7.3-51.1   <NA>       [2] <NA>                              
 R Matrix           1.2-16     <NA>       [2] <NA>                              
   memoise          1.1.0      2017-04-21 [1] CRAN (R 3.5.0)                    
   microbenchmark   1.4-6      2018-10-18 [1] CRAN (R 3.5.0)                    
   modelr           0.1.4      2019-02-18 [1] CRAN (R 3.5.2)                    
   multcomp         1.4-10     2019-03-05 [1] CRAN (R 3.5.2)                    
   munsell          0.5.0      2018-06-12 [1] CRAN (R 3.5.0)                    
   mvtnorm          1.0-10     2019-03-05 [1] CRAN (R 3.5.2)                    
 R nlme             3.1-137    <NA>       [2] <NA>                              
   nvimcom        * 0.9-82     2019-03-30 [1] local                             
   pacman         * 0.5.1      2019-03-11 [1] CRAN (R 3.5.2)                    
   pillar           1.3.1      2018-12-15 [1] CRAN (R 3.5.0)                    
   pkgbuild         1.0.3      2019-03-20 [1] CRAN (R 3.5.3)                    
   pkgconfig        2.0.2      2018-08-16 [1] CRAN (R 3.5.0)                    
   pkgload          1.0.2      2018-10-29 [1] CRAN (R 3.5.0)                    
   plyr             1.8.4      2016-06-08 [1] CRAN (R 3.5.0)                    
   prettyunits      1.0.2      2015-07-13 [1] CRAN (R 3.5.0)                    
   processx         3.3.0      2019-03-10 [1] CRAN (R 3.5.2)                    
   profmem          0.5.0      2018-01-30 [1] CRAN (R 3.5.0)                    
   ps               1.3.0      2018-12-21 [1] CRAN (R 3.5.0)                    
   purrr          * 0.3.2      2019-03-15 [1] CRAN (R 3.5.2)                    
   R6               2.4.0      2019-02-14 [1] CRAN (R 3.5.2)                    
   rbenchmark       1.0.0      2012-08-30 [1] CRAN (R 3.5.0)                    
   rcmdcheck        1.3.2      2018-11-10 [1] CRAN (R 3.5.0)                    
   Rcpp             1.0.1      2019-03-17 [1] CRAN (R 3.5.2)                    
   readr          * 1.3.1      2018-12-21 [1] CRAN (R 3.5.0)                    
   readxl           1.3.1      2019-03-13 [1] CRAN (R 3.5.2)                    
   remotes          2.0.2      2018-10-30 [1] CRAN (R 3.5.0)                    
   rlang            0.3.3      2019-03-29 [1] CRAN (R 3.5.3)                    
   roxygen2         6.1.1      2018-11-07 [1] CRAN (R 3.5.0)                    
   rprojroot        1.3-2      2018-01-03 [1] CRAN (R 3.5.0)                    
   rstudioapi       0.10       2019-03-19 [1] CRAN (R 3.5.3)                    
   rvest            0.3.2      2016-06-17 [1] CRAN (R 3.5.0)                    
   sandwich         2.5-0      2018-08-17 [1] CRAN (R 3.5.0)                    
   scales           1.0.0      2018-08-09 [1] CRAN (R 3.5.0)                    
   sessioninfo      1.1.1      2018-11-05 [1] CRAN (R 3.5.0)                    
   stringi          1.4.3      2019-03-12 [1] CRAN (R 3.5.2)                    
   stringr        * 1.4.0      2019-02-10 [1] CRAN (R 3.5.2)                    
 R survival         2.43-3     <NA>       [2] <NA>                              
   testthat         2.0.1      2018-10-13 [1] CRAN (R 3.5.0)                    
   TH.data          1.0-10     2019-01-21 [1] CRAN (R 3.5.2)                    
   tibble         * 2.1.1      2019-03-16 [1] CRAN (R 3.5.2)                    
   tictoc           1.0        2014-06-17 [1] CRAN (R 3.5.0)                    
   tidyr          * 0.8.3      2019-03-01 [1] CRAN (R 3.5.2)                    
   tidyselect       0.2.5      2018-10-11 [1] CRAN (R 3.5.0)                    
   tidyverse      * 1.2.1      2017-11-14 [1] CRAN (R 3.5.0)                    
   usethis        * 1.4.0.9000 2019-03-22 [1] Github (r-lib/usethis@ef3d8bf)    
   withr            2.1.2      2018-03-15 [1] CRAN (R 3.5.0)                    
   xfun             0.5        2019-02-20 [1] CRAN (R 3.5.2)                    
   xml2             1.2.0      2018-01-24 [1] CRAN (R 3.5.0)                    
   xopen            1.0.0      2018-09-17 [1] CRAN (R 3.5.1)                    
   zoo              1.8-5      2019-03-21 [1] CRAN (R 3.5.3)                    

[1] /Users/Ben/R_lib
[2] /Library/Frameworks/R.framework/Versions/3.5/Resources/library

 P ── Loaded and on-disk path mismatch.
 R ── Package was removed from disk.
```
