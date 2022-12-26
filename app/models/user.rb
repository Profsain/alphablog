class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy

  validates :username, presence: true, uniqueness: true length: { minimum: 3, maximum: 50 }
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: email_regex }, uniqueness: { case_sensitive: false }

end