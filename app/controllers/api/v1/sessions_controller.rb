class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    account = Account.find_by(email: auth_params[:email].downcase)

    if !account.nil? && account.authenticate(auth_params[:password])
      jwt = Auth.issue({account: account.id})
      render json: {jwt: jwt}
    else
      head :forbidden
    end

  end

  private

    def auth_params
      print(params)
      params.require(:auth).permit(:email, :password)
    end
end