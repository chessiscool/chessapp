<<<<<<< HEAD
# frozen_string_literal: true

=======
>>>>>>> 762ea5f5c6f95f9adf39127e991b29cee37821c7
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

<<<<<<< HEAD
class ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in
    # alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
=======
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
>>>>>>> 762ea5f5c6f95f9adf39127e991b29cee37821c7
end
