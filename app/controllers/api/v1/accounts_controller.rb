class AccountsController < ApplicationController
  def create
    Account.create(params)
  end

  def update
    account = Account.find(params[:id])
    account.update(params)
  end

  def delete
    account = Account.find(params[:id])
    account.destroy
  end
end