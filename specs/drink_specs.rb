require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

class DrinkTest < MiniTest::Test

  def test_drink_name
    vodka = Drink.new("russian vodka", 5.0, 40)
    assert_equal("russian vodka", vodka.name)
  end

  def test_drink_price
    white_wine = Drink.new("white wine", 8.0, 15.5)
    assert_equal(8.0, white_wine.show_price)
  end

  def test_alcohol_level
    white_wine = Drink.new("white wine", 8.0, 15.5)
    assert_equal(15.5, white_wine.alcohol_level)
  end

end
