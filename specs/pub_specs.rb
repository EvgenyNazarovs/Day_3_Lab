require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

class PubTest < MiniTest::Test

  def setup
    @george = Customer.new("George", 100.0, 27)

    @vodka = Drink.new("Vodka", 4.0)
    @gin = Drink.new("Gin", 3.5)
    @ipa = Drink.new("IPA", 5.0)
    @pinot_grigio = Drink.new("Pinot Grigio", 10.0)
    @house_wine = Drink.new("House Wine", 6.0)

    @drinks = [@vodka, @gin, @ipa, @pinot_grigio, @house_wine]

    @stereo = Pub.new("Stereo", 500, @drinks)

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

end




# Extensions:
#
# Add an age to the Customer. Make sure the Pub checks the
# age before serving the Customer.

# Add alcohol_level to the Drink, and a drunkenness level
# to the Customer. Every time a Customer buys a drink,
# the drunkenness level should go up by the alcohol_level.
# Pub should refuse service above a certain level of drunkenness!
