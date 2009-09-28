class Availability < ActiveRecord::Base
  default_scope :order => 'text ASC'
end
