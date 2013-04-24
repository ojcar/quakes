class Api::EarthquakesController < ActionController::Base
  respond_to :json

  def index
    if (params.has_key?(:on) || params.has_key?(:since) || params.has_key?(:over) || params.has_key?(:near))
      respond_with(Quake.search(params))
    else
      respond_with(Quake.all)
    end
  end
end