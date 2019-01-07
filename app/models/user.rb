class User < ApplicationRecord
  belongs_to :account
  has_many :projects
  has_many :tasks, through: :projects
  has_many :tasks

  validates :first_name, presence: true, allow_nil: true
  validates :last_name, presence: true, allow_nil: true
end
