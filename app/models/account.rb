class Account < ApplicationRecord
  belongs_to :client
  validates :initial_balance, :current_balance, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def withdraw!(amount)
    update!(current_balance: current_balance - amount)
  end

  def deposit!(amount)
    update!(current_balance: current_balance + amount)
  end

  def check_initial_balance
    return initial_balance
  end

  def check_current_balance
    return current_balance
  end

end

