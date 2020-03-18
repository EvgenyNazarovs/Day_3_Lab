require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

class CustomerTest < MiniTest::Test

  def test_customer_name
    alex = Customer.new("Alex", 300, 25)
    assert_equal("Alex", alex.show_name)
  end

  def test_customer_wallet
    andrew = Customer.new("Andrew", 25, 18)
    assert_equal(25, andrew.check_money)
  end

  def test_customer_makes_payment
    andrew = Customer.new("Andrew", 25, 15)
    andrew.make_payment(5)
    assert_equal(20, andrew.check_money)
  end

  def test_show_age
    andrew = Customer.new("Andrew", 25, 18)
    assert_equal(18, andrew.show_age)
  end

  def test_customer_drunkennes_level
    alex = Customer.new("Alex", 300, 25)
    white_wine = Drink.new("white wine", 8.0, 15.5)
    alex.increase_drunkenness_level(white_wine)
    assert_equal(2, alex.drunkenness_level)
  end

end
