require 'test/unit'
require 'rubygems'

class SemverTest < Test::Unit::TestCase
  def test_four_part_versions_should_error
    #FAILS
    assert_raise do
      Gem::Version.create("1.2.3.0")
    end
  end

  def test_should_give_release_versions_precedence_over_pre_release_versions
    #PASSES
    v1 = Gem::Version.create("1.2.3")
    v2 = Gem::Version.create("1.2.3-10")
    assert_equal(1, v1 <=> v2)
  end

  def test_should_sort_prerelease_with_only_digits_numerically
    #PASSES
    v1 = Gem::Version.create("1.2.3-10")
    v2 = Gem::Version.create("1.2.3-9")
    assert_equal(1, v1 <=> v2)
  end

  def test_should_ignore_build_metadata
    #FAILS
    # ArgumentError: Malformed version number string 1.2.3+10
    v1 = Gem::Version.create("1.2.3+10")
    v2 = Gem::Version.create("1.2.3+9")
    assert_equal(1, v1 <=> v2)
  end
end
