class SessionsController < ApplicationController
  before_action :ensure_params_exist

  respond_to :json

  wrap_parameters format: []

  def create
    email = login_params[:email]
    password = login_params[:password]
    
    @client = Client.find_for_database_authentication(email: email)

    return render_invalid_credentials if @client.blank?

    if @client.valid_password?(password)
      sign_in("client", @client)
      sign_in(@client)
      authenticate_client!

      logger.info("Client password is valid. #{@client.name} signed in! ")

      response = {
        success: true,
        error: nil,
        data: {
          message: "Session created successfully!"
        },
      }

      if client_signed_in?
        logger.info("confirmed signedin")
      end

      render json: response, status: :ok
      # binding.pry
    else
      render_invalid_credentials
    end
  end
  
  def destroy
    sign_out(current_client)
    response = {
      success: true,
      error: nil,
      data:  {
        message: "Session destroyed!"
      }
    }
    render json: response, status: :ok
  end
  
  private
  def ensure_params_exist
    return unless params[:email.blank?]
    render json: {success: false, message: "missing user_login parameter"}, status: :unprocessable_entity
  end

  def render_invalid_credentials
    response = {
      success: false,
      error: {
        message: "Invalid credentials!"
      },
      data: nil
    }

    render json: response, status: :unauthorized
  end

  def login_params
    params.permit(:session, :email, :password)
  end
end



