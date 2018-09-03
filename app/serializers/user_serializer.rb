class UserSerializer < ApplicationSerializer
  attributes :email, :name, :auth_token

  def auth_token
    AuthenticateUser.auth_token(object.id)
  end

end
