class Task < ApplicationRecord
  validates :name, :note, presence: true
  has_many :category_tasks
  has_many :categories, through: :category_tasks
	belongs_to :user, foreign_key: true, optional: true
  enum status: { waiting: 0, carry_on: 1, finished: 2 }
end
