class Tag < ActiveRecord::Base
  has_and_belongs_to_many :activities

  validates :name, :tagtype, :tagcolor, :presence => true

  def self.filtered(tags)
    find_by_id(tags)
  end

end
