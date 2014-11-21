class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :due_on, presence: true

  def completed_tasks
    self.tasks.where(completed: true).size
  end

  def total_tasks
    self.tasks.size
  end

end