require 'appscript'
require 'test/unit/assertions'

module CalculatorDriver
  
  include Appscript
  include Test::Unit::Assertions
  
  def activate_calculator_app
    root_path = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    app_path = File.expand_path(File.join(root_path, 'Calculator.app'))
    app(app_path).activate
  end
  
  def quit_calculator_app
    menu_bar = calculator_process.menu_bars[1]
    menu = menu_bar.menu_bar_items['Calculator'].menus['Calculator']
    quit = menu.menu_items['Quit Calculator']
    quit.click
  end
  
  def calculator_process
    system_events = app('System Events')
    system_events.processes['Calculator']
  end
  
  def calculator_app_active?
    calculator_process == 'Calculator'
  end
  
  def setup_calculator_driver
    activate_calculator_app unless calculator_app_active?
    window = calculator_process.windows['Calculator']
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