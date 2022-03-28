class Task < ApplicationRecord
  validates :name, :note, :due_date, :status, :priority, presence: true
  has_many :category_tasks
  has_many :categories, through: :category_tasks
	belongs_to :user, foreign_key: true, optional: true
  enum status: { waiting: 0, carry_on: 1, finished: 2 }
  enum priority: { high: 0, medium: 1, low: 2 }
  
  def self.i18n_status(hash = {})
    statuses.keys.each { |key| hash[I18n.t("checkpoint_status.#{key}")] = key }
    hash
  end

  attr_reader :tag_tokens

  def tag_tokens=(tokens)
    self.tag_ids = Category.get_ids_from_tokens(tokens)
  end
end
