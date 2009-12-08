require 'test/unit'
require 'calculator_driver'

class DivisionTest < Test::Unit::TestCase
  
  include CalculatorDriver
  
  def setup
    setup_calculator_driver
    click_button('C')
  end
  
  def test_dividing_two_single_digit_numbers
    input_with_buttons('6')
    click_button('/')
    input_with_buttons('3')
    click_button('=')
    
    displays_number('2')
  end
  
  def test_dividing_two_multiple_digit_numbers
    input_with_buttons('56088')
    click_button('/')
    input_with_buttons('123')
    click_button('=')
    
    displays_number('456')
  end
  
  def test_dividing_two_fractional_numbers
    input_with_buttons('5.6088')
    click_button('/')
    input_with_buttons('4.56')
    click_button('=')
    
    displays_number('1.23')
  end
  
  def test_dividing_a_negative_number_by_a_positive_number
    input_with_buttons('-6')
    click_button('/')
    input_with_buttons('3')
    click_button('=')
    
    displays_number('-2')
  end
  
end