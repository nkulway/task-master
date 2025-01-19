# spec/spec_helper.rb
require 'rails_helper'
require 'rswag/specs'
RSpec.configure do |config|
  config.before(:each) do
    # Mock the swagger_api method to avoid errors during tests
    allow_any_instance_of(ApplicationController).to receive(:swagger_api).and_return(nil)
  end
end
