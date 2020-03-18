class Drink

  attr_reader :name

  def initialize(name, price)
    @name = name
    @price = price
  end

  def show_price
    @price
  end

end
