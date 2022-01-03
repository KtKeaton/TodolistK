class Category < ApplicationRecord
  has_many :category_tasks
  has_many :tasks, through: :category_tasks
end
