class Activity < ActiveRecord::Base
  belongs_to :person
  has_and_belongs_to_many :tags

  #validates :shortname, :description, :targetdate, presence: true
  #validates_length_of :description, :minimum => 20, :maximum => 50

  scope :with_tags, lambda { |tags|
    joins(:tags).
        where(:activities_tags => { :tag_id => tags } )
  }

  self.per_page = 5

  def self.tags
   Tag.all(:include => {:activities => :tags}, :conditions => ["activity.id=?", self])
  end

end
