class CreateProductAvailabilities < ActiveRecord::Migration
  def self.up
    add_column :products, :availability_id_in_stock, :integer, :default => 1
    add_column :products, :availability_id_out_of_stock, :integer, :default => 2
  end

  def self.down
    remove_column :products, :availability_id_in_stock
    remove_column :products, :availability_id_out_of_stock
  end
end
