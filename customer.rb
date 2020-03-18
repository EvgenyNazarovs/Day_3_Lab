class Customer

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
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



end
