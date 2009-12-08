class Display
  
  def initialize
    clear
  end
  
  def set(value)
    @value = value.to_s
  end
  
  def push(character)
    if @value == '0'
      @value = character
    else
      @value += character
    end
  end
  
  def clear
    @value = '0'
  end
  
  def to_f
    @value.to_f
  end
  
  def to_i
    @value.to_i
  end
  
  def to_s
    to_f == to_i ? to_i.to_s : to_f.to_s
  end
  
end