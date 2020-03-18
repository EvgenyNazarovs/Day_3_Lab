class Customer

  attr_accessor :drunkenness_level

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness_level = 0
  end

  def show_name
    @name
  end

  def check_money
    @wallet
  end

  def make_payment(amount)
    @wallet -= amount
  end

  def show_age
    @age
  end

  def increase_drunkenness_level(drink)
    if drink.alcohol_level <= 10
      @drunkenness_level += 1
    elsif (drink.alcohol_level > 10 && drink.alcohol_level < 30)
      @drunkenness_level = @drunkenness_level + 2
    else
      @drunkenness_level = @drunkenness_level + 4
    end
  end

  def decrease_drunkenness_level(food)
    @drunkenness_level = @drunkenness_level - food.rejuvenation_level
  end

#linter-ruby

end
