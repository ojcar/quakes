class CreateQuakes < ActiveRecord::Migration
  def change
    create_table :quakes do |t|
      t.string :src
      t.string :eqid
      t.integer :version
      t.datetime :datetime
      t.decimal :latitude, :precision => 7, :scale => 4
      t.decimal :longitude, :precision => 7, :scale => 4
      t.decimal :magnitude, :precision => 3, :scale => 1
      t.decimal :depth, :precision => 5, :scale => 2
      t.integer :nst
      t.string :region

      t.timestamps
    end
  end
end
