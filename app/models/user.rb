class User < ApplicationRecord
  # self is referencing each object of User class, and before saving runs this method "before_save"
  before_save { self.email = email.downcase }
  
  has_many :articles

  validates :username, presence: true, 
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, 
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
end

# uniqueness: true