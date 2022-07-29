FactoryBot.define do
  sequence :string, aliases: [:first_name,
                              :last_name,
                              :password,
                              :avatar,
                              :name,
                              :description] do |n|
    "string#{n}"
  end
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :expired_at do
    Date.today + 3.days
  end
end
