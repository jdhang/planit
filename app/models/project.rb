class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  validates :name, presence: true
  validates :due_on, presence: true

end