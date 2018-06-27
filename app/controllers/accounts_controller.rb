class AccountsController < ApplicationController
  before_action :set_account, only: [:show]

  def index
    @acounts = Accounts.all
    render json: @accounts
  end

  def show
    render json: @account
  end

  def create
    account = Account.new(account_params)
    if  account.save
      render json: account, status: :created
    else
      render json: account.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(:name, :balance)
  end

  def set_account
    @account = Account.find(params[:id])
  end
end