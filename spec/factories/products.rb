FactoryBot.define do
  factory :product do
    sequence :name do |n|
      "A Name#{n}"
    end
    description Faker::Fallout.quote
    image "http://i.imgur.com/BCbxVui.png"
    price 3.50
  end
end
