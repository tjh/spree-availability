class Availability < ActiveRecord::Base
  default_scope :order => 'text ASC'
  has_many :products_in_stock,      :class_name => 'Product', :foreign_key => 'availability_id_in_stock'
  has_many :products_out_of_stock,  :class_name => 'Product', :foreign_key => 'availability_id_out_of_stock'

  validates_presence_of   :text
  validates_uniqueness_of :text

  def in_use_by_products?
    self.products_in_stock.count + self.products_out_of_stock.count > 0
  end

end
