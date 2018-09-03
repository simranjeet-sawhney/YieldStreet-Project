# app/models/user.rb
class User < ApplicationRecord

  has_secure_password

  # Validations
  validates_presence_of :name
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password_digest

  # set user post signin
  def login_success(current_ip)
    self.last_sign_in_ip = current_sign_in_ip
    self.current_sign_in_ip = current_ip if current_ip.present?
    self.sign_in_count += 1
    self.last_sign_in_at = current_sign_in_at
    self.current_sign_in_at = Time.now
    save
  end

end
