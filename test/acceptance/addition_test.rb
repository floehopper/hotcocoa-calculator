require 'test/unit'
require 'calculator_driver'

class AdditionTest < Test::Unit::TestCase
  
  include CalculatorDriver
  
  def setup
    setup_calculator_driver
    click_button('C')
  end
  
  def test_adding_two_single_digit_numbers
    input_with_buttons('1')
    click_button('+')
    input_with_buttons('2')
    click_button('=')
    
    displays_number('3')
  end
  
  def test_adding_two_multiple_digit_numbers
    input_with_buttons('123')
    click_button('+')
    input_with_buttons('456')
    click_button('=')
    
    displays_number('579')
  end
  
  def test_adding_two_fractional_numbers
    input_with_buttons('1.23')
    click_button('+')
    input_with_buttons('4.56')
    click_button('=')
    
    displays_number('5.79')
  end
  
  def test_adding_a_positive_number_to_a_negative_number
    input_with_buttons('-2')
    click_button('+')
    input_with_buttons('5')
    click_button('=')
    
    displays_number('3')
  end
  
end