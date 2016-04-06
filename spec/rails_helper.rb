ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/poltergeist'
require 'launchy'
include Warden::Test::Helpers
Warden.test_mode!

Capybara.javascript_driver = :poltergeist

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Devise::TestHelpers, type: :controller
  config.include Devise::TestHelpers, type: :view
end

def expect_no_page_reload
  page.evaluate_script "$(document.body).addClass('not-reloaded')"
  yield
  expect(page.has_css?("div")).to be true
end

def clear_users
  User.delete_all
end
