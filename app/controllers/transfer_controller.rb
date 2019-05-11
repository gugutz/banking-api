class TransferController < ApplicationController

  def transfer!
    # TransferService.transfer!(current_user, transfer_params)
    Account.transaction do
      source_account = Account.find(params[:source_account_id]) 
      destination_account = Account.find(params[:destination_account_id]) 
      amount = params[:amount]
      user = params[:user]

      source_account.withdraw!(params[:amount])
      destination_account.deposit!(params[:amount])

      Audit.create!(user: user, source_account_id: source_account.id, destination_account_id: destination_account.id, amount: amount, transfered_at: DateTime.now)

    render json: {
      user: user,
      source_account: source_account.id,
      destination_account: destination_account.id,
      amount: amount
    }, status: :created, error: nil
    end

  end

  private 

  def transfer_params
    params.require(:transfer).permit(:user, :source_account_id, :destination_account_id, :amount)
  end

end


