require 'test/unit'
require 'mocha/setup'
require 'listen_and_write'
require_relative 'ext/module'

class OperatingSystemTest < Test::Unit::TestCase
  def test_is_mac?
    Object.stub_const_and_test(:RUBY_PLATFORM, 'x86_64-darwin11.2.0') { assert_equal(true, ListenAndWrite::OperatingSystem.send(:is_mac?)) }
  end
  
  def test_is_linux?
    Object.stub_const_and_test(:RUBY_PLATFORM, 'x86_64-linux') { assert_equal(true, ListenAndWrite::OperatingSystem.send(:is_linux?)) }
  end

  def test_is_windows?
    Object.stub_const_and_test(:RUBY_PLATFORM, 'i386-mingw32') { assert_equal(true, ListenAndWrite::OperatingSystem.send(:is_windows?)) }
  end
  
  def test_supported?
    Object.stub_const_and_test(:RUBY_PLATFORM, 'x86_64-darwin11.2.0') { assert_equal(true, ListenAndWrite::OperatingSystem.send(:supported?)) }
    Object.stub_const_and_test(:RUBY_PLATFORM, 'x86_64-linux') { assert_equal(false, ListenAndWrite::OperatingSystem.send(:supported?)) }
    Object.stub_const_and_test(:RUBY_PLATFORM, 'i386-mingw32') { assert_equal(false, ListenAndWrite::OperatingSystem.send(:supported?)) }
  end
end