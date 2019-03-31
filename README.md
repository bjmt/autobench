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
* Running benchmark 2: Different tool [0.03 m]
* Running benchmark 3: Different tool 2 [0.03 m]
* Running benchmark 4: Skipped tests [SKIPPED]
* Running benchmark 6: Failing test [ERROR]
All benchmarks completed.
Total runtime: 0.07 minutes
```

### Text results

See [example-text.txt](inst/extdata/example-text.txt) for the output file,
or [example-markdown.md](inst/extdata/example-markdown.md) for the markdown version.
