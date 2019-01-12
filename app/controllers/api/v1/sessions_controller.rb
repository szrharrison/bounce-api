class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    account = Account.find_by(email: auth_params[:email].downcase)

    if account.exists? && account.authenticate(auth_params[:password])
      jwt = Auth.issue({account: account.id})
      render json: {jwt: jwt}
    end

  end

  private

    def auth_params
      params.require(:auth).permit(:email, :password)
    end
end