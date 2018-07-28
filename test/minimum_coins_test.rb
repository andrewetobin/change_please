require 'minitest/autorun'
require 'minitest/emoji'
require './lib/minimum_coins'

class MinimumCoinsTest < Minitest::Test

  def setup
    @minimum_coins = MinimumCoins.new
  end

  def test_it_exists
    assert_instance_of MinimumCoins, @minimum_coins
  end

  def test_convert_to_integer
    assert_equal 248, @minimum_coins.convert(2.48)
    assert_equal 10367, @minimum_coins.convert(103.67)
  end

  def test_how_many
    expected_1 = {Quarters: 9, Dimes: 2, Nickels: 0, Pennies: 3}
    expected_2 = {Quarters: 414, Dimes: 1, Nickels: 1, Pennies: 2}

    assert_equal expected_1, @minimum_coins.how_many(248)
    assert_equal expected_2, @minimum_coins.how_many(10367)
  end

  def test_answer
    expected_1 = {Quarters: 9, Dimes: 2, Nickels: 0, Pennies: 3}
    expected_2 = {Quarters: 414, Dimes: 1, Nickels: 1, Pennies: 2}

    assert_equal expected_1, @minimum_coins.answer(2.48)
    assert_equal expected_2, @minimum_coins.answer(103.67)
  end

  def test_number_of_coins
    expected_1 = 14
    expected_2 = 418
    @minimum_coins.answer(2.48)
    assert_equal expected_1, @minimum_coins.number_of_coins
    @minimum_coins.answer(103.67)
    assert_equal expected_2, @minimum_coins.number_of_coins
  end
end
