require 'hotcocoa'; include HotCocoa

require 'model'
require 'view'

class Calculator
  
  def initialize
    @model = Model.new
  end
  
  def show
    application :name => "Calculator" do |app|
      @view = View.new(self)
      %w(0 1 2 3 4 5 6 7 8 9 .).each do |digit|
        @view.buttons[digit].on_action { press(digit) }
      end
      %w(+ - * /).each do |operation|
        @view.buttons[operation].on_action { operand(operation) }
      end
      @view.buttons['C'].on_action { clear }
      @view.buttons['√'].on_action { sqrt }
      @view.buttons['='].on_action { evaluate }
    end
  end
  
  def evaluate
    @model.evaluate
    @view.update_value(@model.current_value)
  end
  
  def press(key)
    @model.press(key)
    @view.update_value(@model.current_value)
  end
  
  def operand(key)
    @model.operand(key)
  end
  
  def sqrt
    @model.sqrt
    @view.update_value(@model.current_value)
  end
  
  def clear
    @model.clear
    @view.update_value(@model.current_value)
  end
  
end

Calculator.new.show
