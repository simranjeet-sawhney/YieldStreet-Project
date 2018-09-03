# frozen_string_literal: true

# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  swagger_controller :authentication, "Authentication Management"

  swagger_api :authenticate do
    summary "Authenticates a User"
    param :form, :email, :string, :required, "Email Address"
    param :form, :password, :string, :required, "Password"
    response :ok, "Success", :User
    response :unauthorized
    response :unprocessable_entity
    response 404
  end

  swagger_model :User do
    description "A User object."
    property :id, :integer, :required, "User Id"
    property :name, :string, :required, "Name"
    property :password_digest, :string, :required, "Password Digest"
    property :email, :string, :required, "Email Address"
    property :last_sign_in_ip, :timestamp, :optional, "Last Signin Ip Address for tracking"
    property :current_sign_in_ip, :timestamp, :optional, "Current Signin Ip Address for tracking"
    property :current_sign_in_ip, :timestamp, :optional, "Current Sign In Ip Address for tracking"
    property :sign_in_count, :integer, :optional, "Total Login Count of a User"
    property :last_sign_in_at, :timestamp, :optional, "Last sign in at Time"
    property :current_sign_in_at, :timestamp, :optional, "Current sign in at Time"
    property :created_at, :timestamp, :optional, "Created At Timestamp"
    property :updated_at, :timestamp, :optional, "Updated At Timestamp"
  end

  # return auth token once user is authenticated
  def authenticate
    param! :email, String, required: true
    param! :password, String, required: true

    user =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call

    # set user details post successful login
    user.login_success(request.remote_ip)

    json_response(user: UserSerializer.new(user), success: true)
  end

  private

  def auth_params
    params.permit(:email, :password, :authentication)
  end
end