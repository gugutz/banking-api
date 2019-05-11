class Account < ApplicationRecord
  belongs_to :client

  def check_balance
    return balance
  end

  def withdraw(ammount)
    self.balance = self.balance - ammount
  end

  def deposit(ammount)
    self.balance = self.balance - ammount
  end

end

