class Availability < ActiveRecord::Base
  default_scope :order => 'text ASC'
  
  validates_presence_of :text
  validates_uniqueness_of :text
end
