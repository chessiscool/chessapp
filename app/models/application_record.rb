# frozen_string_literal: true

# All models inherit from ApplicationRecord as of Rails 5
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
