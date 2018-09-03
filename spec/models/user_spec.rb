# spec/models/user_spec.rb
require 'rails_helper'


RSpec.describe User, type: :model do
  # ensure name, email and password are present before save

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }

  describe 'validations' do
    subject { create(:user) }
    it { is_expected.to validate_uniqueness_of :email }
  end
end
