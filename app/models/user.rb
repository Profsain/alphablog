class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  validates :username, length: { minimum: 3, maximum: 100 }, presence: true
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: email_regex }, uniqueness: { case_sensitive: false }
 

end