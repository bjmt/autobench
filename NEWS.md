# autobench 1.0.0

* Improved markdown output
* Expanded description and function documentation

# autobench 0.0.4

* Results can now be output in markdown format
* After `end()` is called, `run()`, `skip()`, and `update()` will give errors if run
  before `begin()`

# autobench 0.0.3

* All output from benchmarked expressions is suppressed (i.e., `cat`, `print`)
* Error messages are saved
* Fixed memory always showing as bytes for `microbenchmark`/`rbenchmark`
* Printing session info is now optional

# autobench 0.0.2

* `units` option now works when using `rbenchmark`
* README now includes an `rbenchmark` example

# autobench 0.0.1

* Initial version
