ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'database_cleaner/active_record'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # parallelize_setup do |_worker|
  #   DatabaseCleaner.start
  # end

  # parallelize_teardown do |_worker|
  #   DatabaseCleaner.clean_with(:truncation)
  #   DatabaseCleaner.clean
  # end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end
