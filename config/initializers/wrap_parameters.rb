<<<<<<< HEAD
<<<<<<< HEAD
# frozen_string_literal: true

=======
>>>>>>> 762ea5f5c6f95f9adf39127e991b29cee37821c7
=======
# frozen_string_literal: true

>>>>>>> 3e61dbe26a8e71d1481872f13e7fc6702703ee41
# Be sure to restart your server when you modify this file.

# This file contains settings for ActionController::ParamsWrapper which
# is enabled by default.

<<<<<<< HEAD
<<<<<<< HEAD
# Enable parameter wrapping for JSON. You can disable this by setting :format
# to an empty array.
=======
# Enable parameter wrapping for JSON. You can disable this by setting :format to an empty array.
>>>>>>> 762ea5f5c6f95f9adf39127e991b29cee37821c7
=======
# Enable parameter wrapping for JSON. You can disable this by setting :format
# to an empty array.
>>>>>>> 3e61dbe26a8e71d1481872f13e7fc6702703ee41
ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: [:json]
end

# To enable root element in JSON for ActiveRecord objects.
# ActiveSupport.on_load(:active_record) do
#   self.include_root_in_json = true
# end
