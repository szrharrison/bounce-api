class AccountsController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    email = account_params[:email].downcase
    Account.create(email: email, password: account_params[:password])
  end

  def update
    account = Account.find(@current_account.id)
    account.update(account_params)
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