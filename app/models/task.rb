class Task < ActiveRecord::Base
  belongs_to :assigned_to, class_name: "User", foreign_key: "user_id"
  belongs_to :project

  validates :name, presence: true
  validates :due_on, presence: true
  validate :task_due_after_project, on: :create

  def before_project_due_on?
    Project.find(self.project_id).due_on < self.due_on
  end

  def task_due_after_project
    if before_project_due_on?
      errors.add(:due_on, "Task cannot be due after the project")
    end
  end
end