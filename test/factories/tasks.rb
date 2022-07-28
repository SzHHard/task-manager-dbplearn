FactoryBot.define do
  factory :task do
    name
    description
    state { "new_task" }
    author_id { create :user }
    assignee_id { create :user }
  end
end
