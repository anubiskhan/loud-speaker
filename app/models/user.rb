class User < ApplicationRecord
  validates_presence_of :name, :email, :role, :google_sso_token
  validates_uniqueness_of :email

  has_many :contacts
  has_many :orders

  def self.update_or_create(auth)
    user = User.find_by(email: auth['info']['email']) || User.new
    user.attributes = {
      name: auth['info']['first_name'] + ' ' + auth['info']['last_name'],
      email: auth['info']['email'],
      google_sso_token: auth['credentials']['token']
    }
    user.save!
    user
  end
end
