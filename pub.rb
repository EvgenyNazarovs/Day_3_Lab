class Pub

  attr_reader :name
  attr_accessor :drinks

  def initialize(name, till, drinks, food)
    @name = name
    @till = till
    @drinks = drinks
    @food = food
  end

  def till_count
    @till
  end

  def receive_payment(amount)
    @till += amount
  end

  def check_customer_drunkenness(customer)
    if customer.drunkenness_level <= 20
      return true
    else
      return false
  end
end

def check_customer_age(customer)
  return true if customer.show_age >= 18
end

  def sell_drink(customer, drink)
    if check_customer_age(customer) && check_customer_drunkenness(customer)
        customer.make_payment(drink.show_price)
        receive_payment(drink.show_price)
        customer.increase_drunkenness_level(drink)
    elsif check_customer_drunkenness(customer) == false
      return "Sorry, you have had too much alcohol for the night."
    else
      return "Sorry, we can't sell drinks to under 18s."
  end
end

  def sell_food(customer, food)
      customer.make_payment(food.price)
      receive_payment(food.price)
      customer.decrease_drunkenness_level(food)
end

def stock_value(drinks)
  total_value = 0
  drinks.each do |key, value|
    total_value += value[:quantity]
  end
  return total_value
end

def check_customer_money(customer, item)
  if customer.check_money >= item.price
    return true
  else
    return false
  end
end
end
