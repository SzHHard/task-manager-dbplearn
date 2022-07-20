class Task < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :assignee, class_name: "User", optional: true

  state_machine :initial => :new_task do
    event :new_task_to_development do
      transition :new_task => :in_development
    end
    event :new_task_to_archived do
      transition :new_task => :archived
    end
    event :development_to_qa do
      transition :in_development => :in_qa
    end
    event :qa_to_development do
      transition :in_qa => :in_development
    end
    event :qa_to_review do
      transition :in_qa => :in_code_review
    end
    event :review_to_development do
      transition :in_code_review => :in_development
    end
    event :review_to_ready_for_release do
      transition :in_code_review => :ready_for_release
    end
    event :ready_for_release_to_released do
      transition :ready_for_release => :released
    end
    event :released_to_archieved do
      transition :released => :archived
    end
  end

  validates :name, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :description, length: { maximum: 500 }
end
