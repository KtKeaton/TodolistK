class Task < ApplicationRecord
  validates :name, :note, :due_date, :status, :priority, presence: true
  has_many :category_tasks
  has_many :categories, through: :category_tasks, dependent: :destroy
	belongs_to :user, foreign_key: true, optional: true
  enum status: { waiting: 0, carry_on: 1, finished: 2 }
  enum priority: { high: 0, medium: 1, low: 2 }
  
  def self.i18n_status(hash = {})
    statuses.keys.each { |key| hash[I18n.t("checkpoint_status.#{key}")] = key }
    hash
  end

  #setter
  def tag_list=(names)
    self.categories = names.split(',').map do |item|
      Category.where(tag: item.strip).first_or_create!
    end
  end

  def self.tagged_with(name)
    Category.find_by!(tag: name).posts
  end

  def tag_list
    categories.map(&:tag).join(', ')
  end
end
