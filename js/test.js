'use strict';

var semver = require('semver'),
    assert = require('assert');

// semver is used by npm and bower
describe('semver', function () {
    it('should error on four part versions', function () {
        assert.throws(function () { return semver.eq('1.2.3', '1.2.3.0'); });
    });

    it('should give release versions precedence over pre-release versions', function () {
        assert.ok(semver.gt('1.2.3', '1.2.3-10'));
    });

    it('should sort pre-releases with only digits numerically', function () {
        assert.ok(semver.gt('1.2.3-10', '1.2.3-9'));
    });

    it('should ignore build metadata', function () {
        assert.ok(semver.eq('1.2.3+10', '1.2.3+9'));
    });
});
