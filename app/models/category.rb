class Category < ApplicationRecord
  has_many :category_tasks
  has_many :tasks, through: :category_tasks

  def self.get_ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1.capitalize).id }
    tokens.split(',')
  end


end
