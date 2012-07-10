class Person < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :tags, :through => :activities

  validates :firstname, :surname, :idnumber, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  def self.by_user (user)
    where(:userid => user)
  end

  def self.by_tags (user, tags)
    by_user(user).all(:include => { :activities => :tags }, :conditions => { :tags => {:id => tags } })
  end

end
