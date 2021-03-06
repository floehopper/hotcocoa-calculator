require 'test/unit'
require 'calculator_driver'

class BasicTest < Test::Unit::TestCase
  
  include CalculatorDriver
  
  def setup
    setup_calculator_driver
    click_button('C')
  end
  
  def test_clicking_cancel_resets_display
    click_button('1')
    click_button('C')
    
    displays_number('0')
  end
  
  def test_result_after_clicking_decimal_point_without_leading_zero
    click_button('.')
    click_button('1')
    click_button('=')
    
    displays_number('0.1')
  end
  
  def test_result_after_inputting_negative_number
    click_button('-')
    click_button('1')
    click_button('=')
    
    displays_number('-1')
  end
  
  def test_result_after_inputting_float_which_is_actually_an_integer
    click_button('1')
    click_button('.')
    click_button('0')
    click_button('=')
    
    displays_number('1')
  end
  
  def test_cannot_enter_multiple_leading_zeroes
    click_button('0')
    click_button('0')
    click_button('1')
    
    displays_number('1')
  end
  
  def test_can_enter_ten_digits
    input_with_buttons('1234567890')
    
    displays_number('1234567890')
  end
  
end