FactoryBot.define do
  factory :user do
    email {FFaker::Internet.email}
    password {"extreme_secret_password"}
  end
end
