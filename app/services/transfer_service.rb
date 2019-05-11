module TransferService
  class << self

    def transfer!(transfer_params)
      user = transfer_params[:user]
      source_account = Account.find(transfer_params[:source_account_id])
      destination_account = Account.find(transfer_params[:destination_account_id])
      amount = transfer_params[:amount]

      Account.transaction do
        source_account.withdraw!(amount)
        destination_account.deposit!(amount)

        Audit.create!(user: user, source_account_id: source_account.id, destination_account_id: destination_account.id, amount: amount)
      end
    end

  end
end


