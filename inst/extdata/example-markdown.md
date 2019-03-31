# Example markdown output

autobench v0.0.4

2019-03-31 13:44:55

## Initial benchmark settings
  * tool: bench
  * max.reps: 100
  * min.reps: 1
  * min.time: 0.5 seconds
  * check: FALSE
  * stop.on.fail: FALSE

## Benchmark 1: Tests

* Benchmark runtime: 0.02 minutes

```r
e1 = runif(1e+05, 0, 10)
e2 = rnorm(1e+05, 5, 2.5)
```

### Absolute:
|expression|   min|  mean|median|   max|itr/sec|mem_alloc|n_gc|n_itr|total_time|
|:---------|-----:|-----:|-----:|-----:|------:|--------:|---:|----:|---------:|
|`e1`      |2.85ms|3.45ms|3.44ms|4.08ms|  290.1|    786KB|   1|   99|     341ms|
|`e2`      |7.33ms|7.88ms|7.91ms|8.64ms|  127.0|    786KB|   0|   64|     504ms|

### Relative:
|expression|  min| mean|median| max|mem_alloc|total_time|
|:---------|----:|----:|-----:|---:|--------:|---------:|
|`e1`      |1.000|1.000| 1.000|1.00|        1|     1.000|
|`e2`      |2.574|2.285| 2.295|2.12|        1|     1.477|

## Benchmark 2: Different tool

* Benchmark runtime: 0.02 minutes

### Updated benchmark settings
  * tool: microbenchmark

```r
e1 = runif(1e+05, 0, 10)
e2 = rnorm(1e+05, 5, 2.5)
```

### Units: milliseconds
|expr|  min| mean|median|  max|neval|cld|     mem|
|:---|----:|----:|-----:|----:|----:|--:|-------:|
|`e1`|2.970|3.616| 3.527| 9.82|  100|  a|783.8 Kb|
|`e2`|7.341|8.148| 7.963|14.12|  100|  b|783.8 Kb|

### Units: relative
|expr|  min| mean|median|  max|neval|cld|mem|
|:---|----:|----:|-----:|----:|----:|--:|--:|
|`e1`|1.000|1.000| 1.000|1.000|  100|  a|  1|
|`e2`|2.472|2.253| 2.258|1.438|  100|  b|  1|

## Benchmark 3: Different tool 2

* Benchmark runtime: 0.02 minutes

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
|`e1`|    348|   1.000|         100|   3.48|783.8 Kb|      1|
|`e2`|    860|   2.471|         100|   8.60|783.8 Kb|      1|

## Benchmark 4: Skipped tests [SKIPPED]

## Benchmark 5: Failing test [ERROR]

Error: non-numeric argument to binary operator

## All benchmarks complete.

* Total runtime: 0.08 minutes

```
─ Session info ───────────────────────────────────────────────────────────────────────────────────
 setting  value                       
 version  R version 3.5.3 (2019-03-11)
 os       macOS High Sierra 10.13.4   
 system   x86_64, darwin15.6.0        
 ui       X11                         
 language (EN)                        
 collate  en_CA.UTF-8                 
 ctype    fr_CA.UTF-8                 
 tz       America/Toronto             
 date     2019-03-31                  

─ Packages ───────────────────────────────────────────────────────────────────────────────────────
 ! package        * version  date       lib source                         
   assertthat       0.2.1    2019-03-21 [1] CRAN (R 3.5.3)                 
   autobench        0.0.4    2019-03-31 [1] Github (bjmt/autobench@fad12cb)
   bench            1.0.1    2018-06-06 [1] CRAN (R 3.5.0)                 
   cli              1.1.0    2019-03-19 [1] CRAN (R 3.5.2)                 
   codetools        0.2-16   2018-12-24 [2] CRAN (R 3.5.3)                 
   crayon           1.3.4    2017-09-16 [1] CRAN (R 3.5.0)                 
   highr            0.8      2019-03-20 [1] CRAN (R 3.5.3)                 
   knitr            1.22     2019-03-08 [1] CRAN (R 3.5.2)                 
   lattice          0.20-38  2018-11-04 [2] CRAN (R 3.5.3)                 
 R MASS             7.3-51.1 <NA>       [2] <NA>                           
 R Matrix           1.2-16   <NA>       [2] <NA>                           
   microbenchmark   1.4-6    2018-10-18 [1] CRAN (R 3.5.0)                 
   multcomp         1.4-10   2019-03-05 [1] CRAN (R 3.5.2)                 
   mvtnorm          1.0-10   2019-03-05 [1] CRAN (R 3.5.2)                 
   pillar           1.3.1    2018-12-15 [1] CRAN (R 3.5.0)                 
   pkgconfig        2.0.2    2018-08-16 [1] CRAN (R 3.5.0)                 
   profmem          0.5.0    2018-01-30 [1] CRAN (R 3.5.0)                 
   rbenchmark       1.0.0    2012-08-30 [1] CRAN (R 3.5.0)                 
   rlang            0.3.3    2019-03-29 [1] CRAN (R 3.5.3)                 
   sandwich         2.5-0    2018-08-17 [1] CRAN (R 3.5.0)                 
   sessioninfo      1.1.1    2018-11-05 [1] CRAN (R 3.5.0)                 
 R survival         2.43-3   <NA>       [2] <NA>                           
   TH.data          1.0-10   2019-01-21 [1] CRAN (R 3.5.2)                 
   tibble           2.1.1    2019-03-16 [1] CRAN (R 3.5.2)                 
   tictoc           1.0      2014-06-17 [1] CRAN (R 3.5.0)                 
   withr            2.1.2    2018-03-15 [1] CRAN (R 3.5.0)                 
   xfun             0.5      2019-02-20 [1] CRAN (R 3.5.2)                 
   zoo              1.8-5    2019-03-21 [1] CRAN (R 3.5.3)                 

[1] /Users/Ben/R_lib
[2] /Library/Frameworks/R.framework/Versions/3.5/Resources/library

 R ── Package was removed from disk.
```
