class AccountsController < ApplicationController
  before_action :find_account, only: [:show]

  def show
    render json: { account: @account }
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

  def find_account
    @account = Account.find_by(id: params[:id])
    
    unless @account
      render json: { error: 'Account not found' }, status: :not_found
    end
  end
end