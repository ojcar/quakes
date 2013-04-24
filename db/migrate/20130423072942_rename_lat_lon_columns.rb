class RenameLatLonColumns < ActiveRecord::Migration
  def up
    rename_column :quakes, :latitude, :lat 
    rename_column :quakes, :longitude, :lon 
  end

  def down
  end
end
