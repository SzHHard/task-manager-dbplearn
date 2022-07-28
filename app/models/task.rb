class Task < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :assignee, class_name: "User", optional: true

  state_machine initial: :new_task do
    state :new_task
    state :in_development
    state :in_qa
    state :in_code_review
    state :ready_for_release
    state :released
    state :archived

    event :move_to_development do
      transition [:new_task, :in_qa, :in_code_review] => :in_development
    end
    event :move_to_archived do
      transition [:new_task, :released] => :archived
    end
    event :move_to_qa do
      transition in_development: :in_qa
    end
    event :move_to_review do
      transition in_qa: :in_code_review
    end
    event :move_to_ready_for_release do
      transition in_code_review: :ready_for_release
    end
    event :move_to_released do
      transition ready_for_release: :released
    end
  end

  validates :name, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :description, length: { maximum: 500 }
end
