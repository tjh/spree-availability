class CreateAvailabilities < ActiveRecord::Migration
  def self.up
    create_table :availabilities do |t|
      t.string :text
      t.timestamps
    end
  end

  def self.down
    drop_table :availabilities
  end
end
