class Person < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :tags, :through => :activities

  validates :firstname, :surname, :idnumber, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
end
