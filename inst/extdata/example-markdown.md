# Example markdown output

autobenchR v1.1.1

2019-04-02 18:00:23

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
|expression|   min|  mean|median|   max|itr/sec|mem_alloc|n_gc|n_itr|total_time|
|:---------|-----:|-----:|-----:|-----:|------:|--------:|---:|----:|---------:|
|`e1`      |2.79ms|3.28ms|3.24ms|   5ms|  304.8|    786KB|   1|   99|     325ms|
|`e2`      |7.32ms|8.03ms|7.86ms|10.4ms|  124.6|    786KB|   0|   63|     506ms|

### Relative:
|expression|  min| mean|median|  max|mem_alloc|total_time|
|:---------|----:|----:|-----:|----:|--------:|---------:|
|`e1`      |1.000|1.000| 1.000|1.000|        1|     1.000|
|`e2`      |2.629|2.446| 2.424|2.083|        1|     1.556|

## Benchmark 2: Different tool

* Benchmark runtime: 1.2 seconds

### Updated benchmark settings
  * tool: microbenchmark

```r
e1 = runif(1e+05, 0, 10)
e2 = rnorm(1e+05, 5, 2.5)
```

### Units: milliseconds
|expr|  min| mean|median|   max|neval|cld|     mem|
|:---|----:|----:|-----:|-----:|----:|--:|-------:|
|`e1`|2.795|3.421| 3.371| 8.244|  100|  a|783.8 Kb|
|`e2`|7.332|7.946| 7.846|13.793|  100|  b|783.8 Kb|

### Units: relative
|expr|  min| mean|median|  max|neval|cld|mem|
|:---|----:|----:|-----:|----:|----:|--:|--:|
|`e1`|1.000|1.000| 1.000|1.000|  100|  a|  1|
|`e2`|2.623|2.322| 2.327|1.673|  100|  b|  1|

## Benchmark 3: Different tool 2

* Benchmark runtime: 1.3 seconds

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
|`e1`|    346|   1.000|         100|   3.46|783.8 Kb|      1|
|`e2`|    772|   2.231|         100|   7.72|783.8 Kb|      1|

## Benchmark 4: Skipped tests [SKIPPED]

## Some notes

* Bullet point 1

* Bullet point 2

## Benchmark 5: Failing test [ERROR]

Error: non-numeric argument to binary operator

## All benchmarks complete

* Total runtime: 4.4 seconds

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
 date     2019-04-02                  

─ Packages ───────────────────────────────────────────────────────────────────────────────────────
 ! package        * version  date       lib source                          
   assertthat       0.2.1    2019-03-21 [1] CRAN (R 3.5.3)                  
   autobenchR       1.1.1    2019-04-02 [1] Github (bjmt/autobenchR@48e9bdd)
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
   xfun             0.6      2019-04-02 [1] CRAN (R 3.5.3)                  
   zoo              1.8-5    2019-03-21 [1] CRAN (R 3.5.3)                  

[1] /Users/Ben/R_lib
[2] /Library/Frameworks/R.framework/Versions/3.5/Resources/library

 R ── Package was removed from disk.
```
