class Quake < ActiveRecord::Base
  attr_accessible :datetime, :depth, :eqid, :lat, :lon, :magnitude, :nst, :region, :src, :version
end
