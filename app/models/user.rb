class User < ActiveRecord::Base
  has_many :projects
  has_many :tasks

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :password, on: :create, presence: true, length: { minimum: 4 }
end