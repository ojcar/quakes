require 'spec_helper'

describe Api::EarthquakesController do 
  let (:endpoint) { '/api' }

  describe "GET #index" do 
    it 'returns all when no params present' do
      get :index

      # response.status.should == 200
      response.body.should eq(Quake.all.to_json)
    end
  end
end