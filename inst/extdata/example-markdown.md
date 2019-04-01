# Example markdown output

autobench v1.0.0

2019-03-31 21:52:05

## Initial benchmark settings
  * tool: bench
  * max.reps: 100
  * min.reps: 1
  * min.time: 0.5 seconds
  * check: FALSE
  * stop.on.fail: FALSE

## Benchmark 1: Tests

* Benchmark runtime: 1 seconds

```r
e1 = runif(1e+05, 0, 10)
e2 = rnorm(1e+05, 5, 2.5)
```

### Absolute:
|expression|   min|  mean|median|    max|itr/sec|mem_alloc|n_gc|n_itr|total_time|
|:---------|-----:|-----:|-----:|------:|------:|--------:|---:|----:|---------:|
|`e1`      |2.93ms|3.73ms| 3.6ms| 6.11ms|  268.0|    786KB|   1|   99|     369ms|
|`e2`      |7.37ms|8.83ms|8.38ms|15.16ms|  113.2|    786KB|   0|   57|     503ms|

### Relative:
|expression| min| mean|median| max|mem_alloc|total_time|
|:---------|---:|----:|-----:|---:|--------:|---------:|
|`e1`      |1.00|1.000| 1.000|1.00|        1|     1.000|
|`e2`      |2.51|2.367| 2.325|2.48|        1|     1.363|

## Benchmark 2: Different tool

* Benchmark runtime: 1.3 seconds

### Updated benchmark settings
  * tool: microbenchmark

```r
e1 = runif(1e+05, 0, 10)
e2 = rnorm(1e+05, 5, 2.5)
```

### Units: milliseconds
|expr|  min| mean|median|   max|neval|cld|     mem|
|:---|----:|----:|-----:|-----:|----:|--:|-------:|
|`e1`|2.998|3.640| 3.590| 5.995|  100|  a|783.8 Kb|
|`e2`|7.369|8.467| 8.236|15.823|  100|  b|783.8 Kb|

### Units: relative
|expr|  min| mean|median| max|neval|cld|mem|
|:---|----:|----:|-----:|---:|----:|--:|--:|
|`e1`|1.000|1.000| 1.000|1.00|  100|  a|  1|
|`e2`|2.458|2.326| 2.295|2.64|  100|  b|  1|

## Benchmark 3: Different tool 2

* Benchmark runtime: 1.4 seconds

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
|`e1`|    362|   1.000|         100|   3.62|783.8 Kb|      1|
|`e2`|    845|   2.334|         100|   8.45|783.8 Kb|      1|

## Benchmark 4: Skipped tests [SKIPPED]

## Benchmark 5: Failing test [ERROR]

Error: non-numeric argument to binary operator

## All benchmarks complete

* Total runtime: 4.8 seconds

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
   autobench        1.0.0    2019-03-31 [1] Github (bjmt/autobench@d3e26d7)
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
