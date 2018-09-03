# frozen_string_literal: true

# app/controllers/users_controller.rb
class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create]

  swagger_controller :users, "User Controller"

  swagger_api :create do
    summary "Creates a User"
    param :form, :email, :string, :required, "Email Address"
    param :form, :password, :string, :required, "Password"
    response :ok, "Success", :User
    response :unauthorized
    response :unprocessable_entity
    response 404
  end

  swagger_model :User do
    description "User Model"
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

  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = {message: Message.account_created, auth_token: auth_token, success: true}
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password
    )
  end
end