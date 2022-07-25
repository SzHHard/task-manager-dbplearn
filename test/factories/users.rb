FactoryBot.define do
  factory :user do
    first_name
    last_name
    password
    email
    avatar

    factory :developer do
      type { "Developer" }
    end
    # factory :admin do   // is it ok to comment out type? Will it know about admins.rb and work right with it?
    #   type { 'Admin' }
    # end
    factory :manager do
      type { "Manager" }
    end
  end
end
