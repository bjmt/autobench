autobench::begin("example-text.txt", "Example text output", tool = "bench",
                 format = "txt")

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
