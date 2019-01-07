class UsersController < ApplicationController
  def create
    User.create(params)
  end

  def update
    user = User.find(params[:id])
    user.update(params)
  end

  def show
    User.find(params[:id])
  end

  def delete
    user = User.find(params[:id])
    user.destroy
  end
end