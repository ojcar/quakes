require 'net/http'
require 'csv'

namespace :quake_data do
  desc "Get quake list for the last 7 days"
  task :fetch => [:environment] do
    uri = URI('http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt')

    response = Net::HTTP.get_response(uri)
    case response
    when Net::HTTPOK
      CSV.parse(response.body, :headers => true, :header_converters => lambda { |h| h.try(:downcase) }) do |row|
        Quake.find_or_create_by_eqid(row.to_hash)
      end
    else
      puts 'An Error Occurred'
      puts response.inspect
    end
  end
end