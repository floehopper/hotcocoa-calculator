require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper'))

require 'display'

class DisplayTest < Test::Unit::TestCase
  
  def setup
    @display = Display.new
  end
  
  def test_initial_value
    assert_equal '0', @display.to_s
    assert_in_delta 0.0, @display.to_f, 1e-8
  end
  
  def test_clear_value
    @display.push('1')
    @display.clear
    assert_equal '0', @display.to_s
    assert_in_delta 0.0, @display.to_f, 1e-8
  end
  
  def test_entering_single_digit_number
    @display.push('1')
    assert_equal '1', @display.to_s
    assert_in_delta 1.0, @display.to_f, 1e-8
  end
  
  def test_entering_multiple_digit_number
    @display.push('1')
    @display.push('1')
    assert_equal '11', @display.to_s
    assert_in_delta 11.0, @display.to_f, 1e-8
  end
  
  def test_entering_fractional_number
    @display.push('1')
    @display.push('.')
    @display.push('1')
    assert_equal '1.1', @display.to_s
    assert_in_delta 1.1, @display.to_f, 1e-8
  end
  
  def test_setting_single_digit_number
    @display.set(1.0)
    assert_equal '1', @display.to_s
    assert_in_delta 1.0, @display.to_f, 1e-8
  end
  
  def test_setting_multiple_digit_number
    @display.set(11.0)
    assert_equal '11', @display.to_s
    assert_in_delta 11.0, @display.to_f, 1e-8
  end
  
  def test_setting_fractional_number
    @display.set(1.1)
    assert_equal '1.1', @display.to_s
    assert_in_delta 1.1, @display.to_f, 1e-8
  end
  
end