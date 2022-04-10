require 'digest'

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 4 }, presence: true
  validates :role, presence: true, uniqueness: true
  has_many :tasks, dependent: :destroy
  has_many :bookmarks
  
  before_create :encrypt_password

  def encrypt_password
    salted_pw = "eiojre#{self.password}rewropwr"
    self.password = Digest::SHA1.hexdigest(salted_pw)
  end
end
