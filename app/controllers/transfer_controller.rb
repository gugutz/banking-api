class TransferController < ApplicationController

  def transfer

    TransferService.transfer!(transfer_params)

    response = {
      data: transfer_params,
      error: nil
  }
    render json: response, status: :created

  end

  private 

  def transfer_params
    params.permit(:user, :source_account_id, :destination_account_id, :amount)
  end

end



