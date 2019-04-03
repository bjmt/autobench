# autobenchR

Easily write and run large sets of benchmarks all at once, and collect results
in one output file. The `autobenchR` package does not provide any benchmarking
functionality by itself, instead allowing for use of one of the following
packages: [bench](https://cran.r-project.org/web/packages/bench/index.html),
[microbenchmark](https://cran.r-project.org/web/packages/microbenchmark/index.html),
and [rbenchmark](https://cran.r-project.org/web/packages/rbenchmark/index.html).

## Installation

```r
if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")
remotes::install_github("bjmt/autobenchR")
```

## Usage

### Code

```r
autobenchR::begin("results.txt", tool = "bench")

autobenchR::run("Tests",

  e1 = runif(100000, 0, 10),
  e2 = rnorm(100000, 5, 2.5)

)

autobenchR::update(tool = "microbenchmark")
autobenchR::run("Different tool",

  e1 = runif(100000, 0, 10),
  e2 = rnorm(100000, 5, 2.5)

)

autobenchR::update(tool = "rbenchmark", unit = "ms")
autobenchR::run("Different tool 2",

  e1 = runif(100000, 0, 10),
  e2 = rnorm(100000, 5, 2.5)

)

autobenchR::skip()
autobenchR::run("Skipped tests",

  e1 = sample(1:1000, 1000)

)

autobenchR::note(

  "* Bullet point 1",
  "* Bullet point 2",

  name = "Some notes"

)

autobenchR::run("Failing test",

  e1 = 1 + "a"

)

autobenchR::end()
```

### Terminal output

```
Starting benchmarks
* Running benchmark 1: Tests [0.9 s]
* Running benchmark 2: Different tool [1.5 s]
* Running benchmark 3: Different tool 2 [1.7 s]
* Running benchmark 4: Skipped tests [SKIPPED]
* Running benchmark 6: Failing test [ERROR]
All benchmarks completed.
Total runtime: 4.1 seconds
```

### Text results

See [example-text.txt](inst/extdata/example-text.txt) for the output file,
and [example-markdown.md](inst/extdata/example-markdown.md) for the markdown version.
