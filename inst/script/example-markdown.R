#!/usr/bin/env Rscript --quiet

autobenchR::begin("../extdata/example-markdown.md", "Example markdown output",
                  tool = "bench", format = "md")

autobenchR::run("Tests",
                e1 = runif(100000, 0, 10),
                e2 = rnorm(100000, 5, 2.5))

autobenchR::update(tool = "microbenchmark")
autobenchR::run("Different tool",
                e1 = runif(100000, 0, 10),
                e2 = rnorm(100000, 5, 2.5))

autobenchR::update(tool = "rbenchmark", unit = "ms")
autobenchR::run("Different tool 2",
                e1 = runif(100000, 0, 10),
                e2 = rnorm(100000, 5, 2.5))

autobenchR::skip()
autobenchR::run("Skipped tests",
                e1 = sample(1:1000, 1000))

autobenchR::note("* Bullet point 1", "* Bullet point 2", name = "Some notes")

autobenchR::run("Failing test",
                e1 = 1 + "a")

autobenchR::end()
