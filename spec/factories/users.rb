FactoryBot.define do
  factory :user do
    name Faker::Fallout.character
    sequence :email do |n|
      "#{Faker::Internet.email}#{n}"
    end
    role 0
    google_sso_token SecureRandom.urlsafe_base64
  end
end
