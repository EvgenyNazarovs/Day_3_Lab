class Pub

  attr_reader :name
  attr_accessor :drinks

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def till_count
    @till
  end

  def receive_payment(amount)
    @till += amount
  end

  def sell_drink(customer, drink)
    customer.make_payment(drink.show_price)
    receive_payment(drink.show_price)
  end

  def check_customer_age(customer)
    return true if customer.show_age >= 18
  end


end
