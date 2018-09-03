# frozen_string_literal: true

# app/auth/authenticate_user.rb
class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def self.auth_token(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  # Service entry point
  def call
    user
  end

  private

  attr_reader :email, :password

  # verify user credentials
  def user
    user = User.find_by(email: email)
    return user if user&.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end

end