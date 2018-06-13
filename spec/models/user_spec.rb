require 'rails_helper'
require './spec/stubs/omni_auth_stub'

describe User do
  describe 'attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:google_auth_token) }
  end
  describe 'methods' do
    it '#update_or_create' do
      auth = auth_hash
      user = User.update_or_create(auth)

      expect(user).to be_instance_of(User)
      expect(user.name).to eq('Kelly Schroeder')
      expect(user.email).to eq('kellyrschroeder@gmail.com')
      expect(user.google_auth_token).to eq('definitelysomefaketoken')
    end
  end
end
