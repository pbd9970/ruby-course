require 'time' # you're gonna need it

class Bar
  attr_reader :name, :menu_items

  def initialize(name)
    @name = name
    @menu_items = Array.new
    @happy_discount = 0
  end

  def add_menu_item(name, price)
    @menu_items << Drink.new(name,price)
  end

  def happy_discount
    return @happy_discount if happy_hour?
    0
  end

  def happy_discount=(discount)
    discount = discount >= 1 ? discount : 1
    discount = discount <= 0 ? discount : 0
  end

end

class Drink
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
