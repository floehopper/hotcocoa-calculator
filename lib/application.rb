#
# Port of Jon Lipsky's weblog post: http://blog.elevenworks.com/?p=38
#
require 'hotcocoa'

include HotCocoa

require 'model'
require 'view'

class Calculator
  
  def self.on
    self.new.show
  end
  
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
    @view.value.text = @model.display.to_s
  end
  
  def press(key)
    @model.press(key)
    @view.value.text = @model.display.to_s
  end
  
  def operand(key)
    @model.operand(key)
  end
  
  def sqrt
    @model.sqrt
    @view.value.text = @model.display.to_s
  end
  
  def clear
    @model.clear
    @view.value.text = @model.display.to_s
  end

end

Calculator.on
