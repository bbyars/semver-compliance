Semantic Versioning Compliance
==============================

This project tests several packaging tools for strict [semantic versioning compliance](http://semver.org/).
These tests are used in support of an article I'm writing to describe the tension between strict semantic
versioning and continuous delivery.

## Tests

I define strict semantic versioning by four tests:

* **3-part versions** - 1.2.3.4 is an error (no four part versions allowed)
* **Releases first** - 1.2.3 > 1.2.3-10 (releases take precedence over pre-releases)
* **Numeric prereleases** - 1.2.3-10 > 1.2.3-9 (all-numeric prereleases are sorted numerically; a change from semver 1.0)
* **Build metadata** - 1.2.3+10 == 1.2.3+9 (build metadata has no bearing on version precedence)


## Test Results

|                           |How to run                        |3-part versions |Releases first |Numeric prereleases |Build metadata |
|---------------------------|:--------------------------------:|:--------------:|:-------------:|:------------------:|:-------------:|
|[npm][npm], [Bower][bower] |cd js && npm test                 | ![PASS][pass]  | ![PASS][pass] | ![PASS][pass]      | ![PASS][pass] |
|[RubyGems][rubygems]       |cd ruby && bundle install && rake | ![FAIL][fail]  | ![PASS][pass] | ![PASS][pass]      | ![FAIL][fail] |
|[CocoaPods][cocoapods]     |cd ruby && bundle install && rake | ![FAIL][fail]  | ![FAIL][fail] | ![PASS][pass]      | ![FAIL][fail] |
|[Carthage][carthage]       |not yet tested, guesses based on [source](https://github.com/Carthage/Carthage/blob/master/Source/CarthageKit/Version.swift) | ![PASS][pass] | ![PASS][pass] | ![PASS][pass] | ![PASS][pass] |


[pass]: https://github.com/bbyars/semver-compliance/blob/master/images/success.png?raw=true "PASS"
[fail]: https://github.com/bbyars/semver-compliance/blob/master/images/fail.png?raw=true "FAIL"

[npm]: https://www.npmjs.com/
[bower]: http://bower.io/
[rubygems]: https://rubygems.org/
[cocoapods]: https://cocoapods.org/
[carthage]: https://github.com/Carthage/Carthage
