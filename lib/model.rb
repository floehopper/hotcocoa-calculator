require 'accumulator'
require 'display'

class Model
  
  def initialize
    @accumulator = Accumulator.new
    @display = Display.new
  end
  
  def evaluate
    @accumulator.push(@display.to_f)
    result = @accumulator.evaluate
    @display.set(result)
  end
  
  def press(key)
    @display.push(key)
  end
  
  def operand(key)
    @accumulator.push(@display.to_f)
    @accumulator.push(key)
    @display.clear
  end
  
  def sqrt
    result = Math.sqrt(@display.to_f)
    @display.set(result)
  end
  
  def clear
    @display.clear
  end
  
  def current_value
    @display.to_s
  end
  
end