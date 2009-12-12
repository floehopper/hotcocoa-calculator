#
# Port of Jon Lipsky's weblog post: http://blog.elevenworks.com/?p=38
#
require 'hotcocoa'

require 'accumulator'
require 'display'
require 'view'

include HotCocoa

class Calculator
  
  def self.on
    self.new.show
  end
  
  def initialize
    @accumulator = Accumulator.new
    @display = Display.new
  end
  
  def show
    application :name => "Calculator" do |app|
      @view = View.new(self)
      %w(0 1 2 3 4 5 6 7 8 9 .).each do |digit|
        @view.buttons[digit].on_action { press digit }
      end
      %w(+ - * /).each do |operation|
        @view.buttons[operation].on_action { operand operation }
      end
      @view.buttons['C'].on_action { clear }
      @view.buttons['√'].on_action { sqrt }
      @view.buttons['='].on_action { evaluate }
    end
  end
  
  def evaluate
    @accumulator.push(@display.to_f)
    result = @accumulator.evaluate
    @display.set(result)
    @view.value.text = @display.to_s
  end
  
  def press(key)
    @display.push(key)
    @view.value.text = @display.to_s
  end
  
  def operand(key)
    @accumulator.push(@display.to_f)
    @accumulator.push(key)
    @display.clear
  end
  
  def sqrt
    result = Math.sqrt(@display.to_f)
    @display.set(result)
    @view.value.text = @display.to_s
  end
  
  def clear
    @display.clear
    @view.value.text = @display.to_s
  end

end

Calculator.on
