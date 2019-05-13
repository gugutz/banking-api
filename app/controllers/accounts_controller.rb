class AccountsController < ApplicationController
  include ActionView::Helpers::NumberHelper

  before_action :set_account, only: [:show, :update, :destroy]
  rescue_from ::ActiveRecord::RecordNotFound, with: :inexistent_account

  # GET /accounts
  def index
    @accounts = Account.all

    render json: @accounts
  end

  # GET /accounts/1
  def show
    render json: @account
  end

  # GET /balance
  def balance
    account = set_account

    initial_balance = account.check_balance
    deposits = Audit.where(destination_account_id: account.id)
    withdraws = Audit.where(source_account_id: account.id)

    total_deposits = []
    total_withdraws = []

    deposits.each { |transfer|
      amount = transfer.amount
      total_deposits.push(amount)
    }

    withdraws.each { |transfer|
      amount = transfer.amount
      total_withdraws.push(amount)
    }

    total_income = total_deposits.reduce(:+)
    total_outcome = total_withdraws.reduce(:+)
    current_balance = initial_balance + total_income - total_outcome
    balance_in_reais = number_to_currency_br(current_balance)

    response = {
      success: true,
      error: nil,
      data:  {
        message: "The current balance for account #{account.id} is #{balance_in_reais}"
      }
    }
    render json: response, status: :ok
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)

    if @account.save
      render json: @account, status: :created, location: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  def inexistent_account
    response = {
      success: false,
      error: {
        message: "This account does not exist"
      },
      data: nil
    }

    render json: response, status: :not_found
  end

  def number_to_currency_br(number)
    number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".")
  end

  # Only allow a trusted parameter "white list" through.
  def account_params
    params.require(:account).permit(:balance)
  end
end
