class MinimumCoins
  attr_reader :coins

  def initialize
    @coins = {Quarters: 25, Dimes: 10, Nickels: 5, Pennies: 1}
  end

  def answer(dollar_amount)
    integer = convert(dollar_amount)
    answer = how_many(integer)
  end

  def number_of_coins
    @answer.values.sum
  end

  def convert(dollar_amount)
    integer = (dollar_amount * 100).to_i
  end

  def how_many(integer)
    @answer = coins.inject({}) do |hash, (coin, number)|
      hash[coin] = integer / @coins[coin]
      integer -= hash[coin] * number
      hash
    end
    @answer
  end
end
