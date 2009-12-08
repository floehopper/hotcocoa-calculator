require 'test/unit'
require 'calculator_driver'

class MultiplicationTest < Test::Unit::TestCase
  
  include CalculatorDriver
  
  def setup
    setup_calculator_driver
    click_button('C')
  end
  
  def test_multiplying_two_single_digit_numbers
    input_with_buttons('3')
    click_button('*')
    input_with_buttons('2')
    click_button('=')
    
    displays_number('6')
  end
  
  def test_multiplying_two_multiple_digit_numbers
    input_with_buttons('123')
    click_button('*')
    input_with_buttons('456')
    click_button('=')
    
    displays_number('56088')
  end
  
  def test_multiplying_two_fractional_numbers
    input_with_buttons('1.23')
    click_button('*')
    input_with_buttons('4.56')
    click_button('=')
    
    displays_number('5.6088')
  end
  
  def test_multiplying_a_negative_number_by_a_positive_number
    input_with_buttons('-3')
    click_button('*')
    input_with_buttons('2')
    click_button('=')
    
    displays_number('-6')
  end
  
end