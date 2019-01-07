class Task < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :user

  validates :name, presence: true
  validates :importance, inclusion: {in: [0, 1, 2, 3, 4, 5], message: "%{value} is not an integer in 0-5"}
  validates :urgency, inclusion: {in: [0, 1, 2, 3, 4, 5], message: "%{value} is not an integer in 0-5"}
end
