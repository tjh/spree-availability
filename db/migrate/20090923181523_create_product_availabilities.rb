class CreateProductAvailabilities < ActiveRecord::Migration
  def self.up
    add_column :products, :availability_id_in_stock, :integer
    add_column :products, :availability_id_out_of_stock, :integer
  end

  def self.down
    remove_column :products, :availability_id_in_stock
    remove_column :products, :availability_id_out_of_stock
  end
end
