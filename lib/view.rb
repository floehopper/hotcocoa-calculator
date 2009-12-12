class View
  
  attr_reader :value
  
  def initialize(controller)
    main_window = window(
      :frame => [100, 800, 220, 280],
      :title => "Calculator",
      :view => :nolayout,
      :style => [:titled, :closable, :miniaturizable]
    )
    
    @value = text_field(
      :frame => [10, 230, 200, 40],
      :text => controller.display.to_s,
      :font => font(:name => "Tahoma", :size => 22),
      :text_align => :right
    )
    main_window << @value
    
    buttons = view(:frame => [10, 10, 200, 240])
    buttons << calc_button("C",   0, 4)       { controller.clear }
    buttons << calc_button("√",   1, 4)       { controller.sqrt }
    buttons << calc_button("/",   2, 4)       { controller.operand '/' }
    buttons << calc_button("*",   3, 4)       { controller.operand '*' }
    buttons << calc_button("7",   0, 3)       { controller.press '7' }
    buttons << calc_button("8",   1, 3)       { controller.press '8' }
    buttons << calc_button("9",   2, 3)       { controller.press '9' }
    buttons << calc_button("-",   3, 3)       { controller.operand '-' }
    buttons << calc_button("4",   0, 2)       { controller.press '4' }
    buttons << calc_button("5",   1, 2)       { controller.press '5' }
    buttons << calc_button("6",   2, 2)       { controller.press '6' }
    buttons << calc_button("+",   3, 2)       { controller.operand '+' }
    buttons << calc_button("1",   0, 1)       { controller.press '1' }
    buttons << calc_button("2",   1, 1)       { controller.press '2' }
    buttons << calc_button("3",   2, 1)       { controller.press '3' }
    buttons << calc_button("=",   3, 1, 0, 1) { controller.evaluate }
    buttons << calc_button("0",   0, 0, 1, 0) { controller.press '0' }
    buttons << calc_button(".",   2, 0)       { controller.press '.' }
    
    main_window << buttons
    main_window.will_close { exit }
  end
  
  private
  
  def calc_button(name, x, y, w=0, h=0, &block)
    button(
      :title => name,
      :bezel => :regular_square,
      :frame => [x*50, y*43-h*43, 47+w*50, 40+h*43]
    ).on_action(&block)
  end
  
end
