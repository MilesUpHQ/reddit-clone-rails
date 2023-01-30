# frozen_string_literal: true

require 'jwt'

class Api::V1::SessionsController < Devise::SessionsController
  def create
    account = Account.find_for_authentication(email: params[:account][:email])
    if account && account.valid_password?(params[:account][:password])
      sign_in(:account, account)
      payload = { account_id: account.id }
      token = JWT.encode(payload, Rails.application.credentials.secret_key_base)
      render json: { jwt: token, account: account }, status: :created
    else
      render json: { error: account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
