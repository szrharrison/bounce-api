class Api::V1::AccountsController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    email = account_params[:email].downcase
    account = Account.create(email: email, password: account_params[:password])
    jwt = Auth.issue({account: account.id})
    render json: {jwt: jwt}
  end

  def update
    account = Account.find(@current_account.id)
    account.update(account_params)
    render json: {account: account}
  end

  def delete
    account = Account.find(@current_account.id)
    account.destroy
  end

  private

    def account_params
      params.require(:account).permit(:email, :password)
    end
end