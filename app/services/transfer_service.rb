module TransferService
  class << self

    def transfer!(transfer_params)
      client = Client.find(transfer_params[:client_id])
      source_account = Account.find(transfer_params[:source_account_id])
      destination_account = Account.find(transfer_params[:destination_account_id])
      amount = transfer_params[:amount]

      Account.transaction do
        source_account.withdraw!(amount)
        destination_account.deposit!(amount)

        Audit.create!(client_id: client.id, source_account_id: source_account.id, destination_account_id: destination_account.id, amount: amount)
      end
    end

  end
end

