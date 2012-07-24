class Activity < ActiveRecord::Base
  belongs_to :person
  has_and_belongs_to_many :tags

  validates :shortname, :description, :targetdate, presence: true


  delegate :firstname, :to => :person, :prefix => true
  delegate :surname, :to => :person, :prefix => true

  scope :with_tags, lambda { |tags|
    joins(:tags).
        where(:activities_tags => { :tag_id => tags } )
  }

  self.per_page = 5

  def self.tags
   Tag.all(:include => {:activities => :tags}, :conditions => ["activity.id=?", self])
  end

  def self.due_today(user)
    Activity.where(:userid => user).all(:conditions => ["targetdate LIKE ?", Date.today] )
  end

  def self.due_in_five_days(user)
    Activity.where(:userid => user).all(:conditions => ["targetdate LIKE ?", Date.today + 5] )
  end

end
