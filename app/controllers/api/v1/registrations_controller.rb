# frozen_string_literal: true

require 'jwt'

class Api::V1::RegistrationsController < Devise::RegistrationsController
  def create
    @account = Account.new(account_params)
    if @account.save
      payload = { account_id: @account.id }
      token = JWT.encode(payload, Rails.application.credentials.secret_key_base)
      render json: { jwt: token, account: @account }, status: :created
    else
      p @account.errors.full_messages
      render json: { error: @account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.permit(:email, :password, :username, :first_name, :last_name, :password_confirmation, :profile_image)
  end

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
