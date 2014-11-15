class Task < ActiveRecord::Base
  belongs_to :assigned_to, class_name: "User", foreign_key: "user_id"
  belongs_to :project

  validates :name, presence: true
  validates :due_on, presence: true

end