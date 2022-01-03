class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 4 }, presence: true
  validates :role, presence: true
  has_many :task, dependent: :destroy
end
