require 'appscript'
require 'test/unit/assertions'

module CalculatorDriver
  
  include Appscript
  include Test::Unit::Assertions
  
  def setup_calculator_driver
    app_path = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'Calculator.app'))
    app(app_path).activate
    system_events = app('System Events')
    process = system_events.processes['Calculator']
    window = process.windows['Calculator']
    @buttons = window.buttons
    @text_fields = window.text_fields
  end
  
  def input_with_buttons(buttons_text)
    buttons_text.each_byte do |byte|
      click_button(byte.chr)
    end
  end
  
  def click_button(character)
    buttons = %w(C 0 1 2 3 4 5 6 7 8 9 . + - * / =)
    if buttons.include?(character)
      @buttons[character].click
    else
      raise "Button does not exist for: #{character}"
    end
  end
  
  def displays_number(expected_result)
    result = @text_fields[1].value.get
    assert_equal expected_result, result
  end
  
end