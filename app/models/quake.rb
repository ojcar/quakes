class Quake < ActiveRecord::Base
  attr_accessible :datetime, :depth, :eqid, :lat, :lon, :magnitude, :nst, :region, :src, :version

  

  class << self
    def search(params)
      # I should have stored the datetimes as unix epoch...

      quakes = scoped
      quakes = quakes.where("date(datetime) = ?", Time.at(params[:on].to_i).utc.to_date) if params.has_key?(:on)
      quakes = quakes.where("datetime > ?", Time.at(params[:since].to_i).utc.to_datetime) if params.has_key?(:since)
      quakes = quakes.where("magnitude > ?", params[:over].to_i) if params.has_key?(:over)
      if params[:near]
        # this_lat = params[:near].split(',')[0]
        # this_lng = params[:near].split(',')[1]
        this_lat,this_lng = params[:near].split(',')

        quakes = Quake.select("*, (3959 * acos(cos(radians(this_lat)) * cos(radians(lat)) * cos(radians(lng) - radians(this_lng)) + sin(radians(37)) * sin(radians(lat)))) AS distance").having("distance < 5")
      end

      quakes
    end
  end
end
