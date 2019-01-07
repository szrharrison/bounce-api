class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    User.create(params)
  end

  def update
    user = User.find(@current_account.user.id)
    user.update(params)
  end

  def show
    User.find(@current_account.user.id)
  end

  def delete
    user = User.find(@current_account.user.id)
    user.destroy
  end
end