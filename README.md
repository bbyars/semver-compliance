Semantic Versioning Compliance
==============================

This project tests several packaging tools for strict [semantic versioning compliance](http://semver.org/).
These tests are used in support of an article I'm writing to describe the tension between strict semantic
versioning and continuous delivery.

## Tests

I define strict semantic versioning by four tests:

* 1.2.3.4 is an error (no four part versions allowed)
* 1.2.3 > 1.2.3-10 (releases take precedence over pre-releases)
* 1.2.3-10 > 1.2.3-9 (all-numeric prereleases are sorted numerically; a change from semver 1.0)
* 1.2.3+10 == 1.2.3+9 (build metadata has no bearing on version precedence)

## Running the Tests

|npm, bower        |rubygems        |
|:----------------:|:--------------:|
|cd js && npm test |cd ruby && rake |

## Test Results

|           |1.2.3.4 is an error |1.2.3 > 1.2.3-10 |1.2.3-10 > 1.2.3-9 |1.2.3+10 == 1.2.3+9 |
|-----------|:------------------:|:---------------:|:-----------------:|:------------------:|
|npm, bower | PASS               | PASS            | PASS              | PASS               |
|rubygems   | FAIL               | PASS            | PASS              | FAIL               |
