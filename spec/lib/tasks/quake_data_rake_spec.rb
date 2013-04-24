require 'spec_helper'
require 'rake'

describe 'quake rake task' do 
  before do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require 'lib/tasks/quake_data'

    @task_name = "quake_data:fetch"
  end

  it 'has environment as prerequisite' do
    @rake[@task_name].prerequisites.should include("environment")
  end

  it 'should create records in the Quake table' do
    Quake.should_receive(:find_or_create_by_eqid)
  end
end