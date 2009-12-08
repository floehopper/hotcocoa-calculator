require 'test/unit'
require 'calculator_driver'

class SubtractionTest < Test::Unit::TestCase
  
  include CalculatorDriver
  
  def setup
    setup_calculator_driver
    click_button('C')
  end
  
  def test_subtracting_two_single_digit_numbers
    input_with_buttons('3')
    click_button('-')
    input_with_buttons('2')
    click_button('=')
    
    displays_number('1')
  end
  
  def test_subtracting_two_multiple_digit_numbers
    input_with_buttons('579')
    click_button('-')
    input_with_buttons('456')
    click_button('=')
    
    displays_number('123')
  end
  
  def test_subtracting_two_fractional_numbers
    input_with_buttons('5.79')
    click_button('-')
    input_with_buttons('4.56')
    click_button('=')
    
    displays_number('1.23')
  end
  
  def test_subtracting_a_positive_number_from_a_negative_number
    input_with_buttons('-2')
    click_button('-')
    input_with_buttons('3')
    click_button('=')
    
    displays_number('-5')
  end
  
end