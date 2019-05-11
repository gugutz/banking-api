class Account < ApplicationRecord
  belongs_to :client
  validates :balance, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def withdraw!(amount)
    update!(balance: balance - amount)
  end

  def deposit!(amount)
    update!(balance: balance + amount)
  end

  def check_balance
    return balance
  end

end

