class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    render json: {user: user}
  end

  def update
    user = User.find(params.require(:id))
    user.update(user_params)
    render json: {user: user}
  end

  def show
    user = User.find(params.require(:id))
    render json: {user: user}
  end

  def delete
    user = User.find(params.require(:id))
    user.destroy
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end