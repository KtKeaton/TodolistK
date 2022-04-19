require 'digest'

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 4 }, presence: true
  validates :user_name, presence: true, uniqueness: true
  has_many :tasks, dependent: :destroy
  has_many :bookmarks
  has_many :favorite_notes,
            through: :bookmarks,
            source: :task

  before_create :encrypt_password

  def favorite?(n)
    favorite_notes.exists?(n.id)
  end

private
  def encrypt_password
    salted_pw = "eiojre#{self.password}rewropwr"
    self.password = Digest::SHA1.hexdigest(salted_pw)
  end
end