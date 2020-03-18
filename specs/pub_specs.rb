require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drink')
require_relative('../customer')
require_relative('../food/')

class PubTest < MiniTest::Test

  def setup
    @george = Customer.new("George", 100.0, 27)
    @steve = Customer.new("Steve", 70, 14)

    @vodka = Drink.new("Vodka", 4.0, 40)
    @gin = Drink.new("Gin", 3.5, 39)
    @ipa = Drink.new("IPA", 5.0, 6)
    @pinot_grigio = Drink.new("Pinot Grigio", 10.0, 15.5)
    @house_wine = Drink.new("House Wine", 6.0, 13)

    @fish_and_chips = Food.new("Fish and Chips", 7.5, 3)
    @cheeseburger = Food.new("Cheeseburger", 6.0, 4)

    @stock = [@drinks, @stock]

    @drinks = {@vodka =>        {quantity: 10},
               @gin =>          {quantity: 50},
               @ipa =>          {quantity: 100},
               @pinot_grigio => {quantity: 15},
               @house_wine =>   {quantity: 20}
             }

    @food = [@fish_and_chips, @cheeseburger]

    @stereo = Pub.new("Stereo", 500, @drinks, @food)

  end

  def test_pub_name
    assert_equal("Stereo", @stereo.name)
  end

  def test_till_count
    assert_equal(500, @stereo.till_count)
  end

  def test_pub_drinks
    assert_equal(@drinks, @stereo.drinks)
  end

  def test_receive_payment
    @stereo.receive_payment(10)
    assert_equal(510, @stereo.till_count)
  end

  def test_sell_drink
    @stereo.sell_drink(@george, @vodka)
    assert_equal(504, @stereo.till_count)
    assert_equal(96, @george.check_money)
  end

  def test_checking_customer_age
    assert_equal(true, @stereo.check_customer_age(@george))
  end

  def test_refuse_to_sell_customer_drink_because_of_age
    assert_equal("Sorry, we can't sell drinks to under 18s.", @stereo.sell_drink(@steve, @gin))
  end

  def test_customer_drunkenness_goes_up_after_buying_drink
    @stereo.sell_drink(@george, @vodka)
    assert_equal(4, @george.drunkenness_level)
  end

  def test_check_that_customer_can_cotinue_drinking
    @george.drunkenness_level = 25
    assert_equal(false, @stereo.check_customer_drunkenness(@george))
  end

  def test_refuse_to_sell_drink_because_of_drunkenness
    @george.drunkenness_level = 30
    assert_equal("Sorry, you have had too much alcohol for the night.", @stereo.sell_drink(@george, @vodka))
  end

  def test_sell_food
    @stereo.sell_food(@george, @fish_and_chips)
    assert_equal(507.5, @stereo.till_count)
  end

  def test_stock_value
    assert_equal(195, @stereo.stock_value(@drinks))
  end

end




# Create a Food class, that has a name, price and rejuvenation_level.
# Each time a Customer buys Food, their drunkenness should
# go down by the rejuvenation_level
# Pub can have a stock (maybe a Hash?) to keep track the amount of
# drinks available (Hard! Might need to change the drinks array to a
#   drinks hash)
# Pub can have a stock_value method to check the total value of
# its drinks
