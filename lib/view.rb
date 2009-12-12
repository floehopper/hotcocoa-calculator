class View
  
  attr_reader :value, :buttons
  
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
    
    @buttons = {}
    @buttons['C'] = calc_button("C",   0, 4)
    @buttons['√'] = calc_button("√",   1, 4)
    @buttons['/'] = calc_button("/",   2, 4)
    @buttons['*'] = calc_button("*",   3, 4)
    @buttons['7'] = calc_button("7",   0, 3)
    @buttons['8'] = calc_button("8",   1, 3)
    @buttons['9'] = calc_button("9",   2, 3)
    @buttons['-'] = calc_button("-",   3, 3)
    @buttons['4'] = calc_button("4",   0, 2)
    @buttons['5'] = calc_button("5",   1, 2)
    @buttons['6'] = calc_button("6",   2, 2)
    @buttons['+'] = calc_button("+",   3, 2)
    @buttons['1'] = calc_button("1",   0, 1)
    @buttons['2'] = calc_button("2",   1, 1)
    @buttons['3'] = calc_button("3",   2, 1)
    @buttons['='] = calc_button("=",   3, 1, 0, 1)
    @buttons['0'] = calc_button("0",   0, 0, 1, 0)
    @buttons['.'] = calc_button(".",   2, 0)
    
    buttons_view = view(:frame => [10, 10, 200, 240])
    @buttons.values.each do |b|
      buttons_view << b
    end
    main_window << buttons_view
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
