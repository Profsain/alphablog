class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy

  before_save { 
    self.email = email.downcase
    self.username = username.downcase
  }

  validates :username, length: { minimum: 3, maximum: 100 }, presence: true
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: email_regex }, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true, length: { minimum: 6, maximum: 100 }

  has_secure_password
end