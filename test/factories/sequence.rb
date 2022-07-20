FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password, :avatar, :state, :name, :description] do |n|
    "string#{n}"
  end
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :expired_at do |n|
    "2022-07-19"
  end
end
