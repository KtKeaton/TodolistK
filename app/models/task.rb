class Task < ApplicationRecord
  validates :name, :note, presence: true
  has_many :category_tasks
  has_many :categories, through: :category_tasks
	belongs_to :user, foreign_key: true, optional: true

  def self.search(search) 
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
