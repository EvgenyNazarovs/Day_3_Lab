class Drink

  attr_reader :name, :alcohol_level

  def initialize(name, price, alcohol_level)
    @name = name
    @price = price
    @alcohol_level = alcohol_level
  end

  def show_price
    @price
  end

end
