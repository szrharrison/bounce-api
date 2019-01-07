class AccountsController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    Account.create(params)
  end

  def update
    account = Account.find(@current_account.id)
    account.update(params)
  end

  def delete
    account = Account.find(@current_account.id)
    account.destroy
  end
end