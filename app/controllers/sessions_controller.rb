class SessionsController < ApplicationController
  before_action :ensure_params_exist

  respond_to :json

  wrap_parameters format: []
  def login
    client = Client.find_for_authentication(email: login_params[:email])
    # @client = Client.find_by(email: login_params[:email] )
    logger.warn(client[:name])

    # return invalid_login_attempt unless resource

    if client.valid_password?(login_params[:password])
      logger.info("Client password is valid.")
      sign_in("client", client)
    end

    if client_signed_in?
      logger.info("signed in!")
      logger.info(current_client.name)
      logger.info(client_session)
      response = {
        data: login_params,
        error: nil
      }
      render json: response, status: :ok
    else
      render json: {error: "login was not successfull"}, status: :unprocessable_entity
    end
  end
  


  def logout
    sign_out(current_client)
    unless client_signed_in?
      render json: {success: "logged out!", status: :ok}
    else
      render json: {error: "logout error"}, status: :unprocessable_entity
    end
  end
  
  def create
  end
  
  private

  def ensure_params_exist
    return unless params[:email.blank?]
    render json: {success: false, message: "missing user_login parameter"}, status: :unprocessable_entity
  end

  def invalid_login_attempt
    warden.custom_failure!
    render json: {
      success: false,
      message: "Error with your login or password"
    },
      status: :unauthorized
  end
  
  def login_params
    params.permit(:email, :password)
  end
end



