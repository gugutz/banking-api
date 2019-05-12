class TransferController < ApplicationController
  # before_action :authenticate_client!

  def transfer
    if client_signed_in?
      TransferService.transfer!(transfer_params)

      response = {
        data: transfer_params,
        error: nil
      }
      render json: response, status: :created
    else
      logger.error("You must be authenticated to use this feature")
      render json: {error: "you must authenticate to use the API"}, status: :unauthorized
    end

  end

  private 

  def transfer_params
    params.permit(:client, :source_account_id, :destination_account_id, :amount)
  end

end



