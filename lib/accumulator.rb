class Accumulator
  
  def initialize
    clear
  end
  
  def push(value)
    @values << value
  end
  
  def evaluate
    result = eval(@values.join(' ')).to_f
    clear
    result
  end
  
  def clear
    @values = []
  end
  
end