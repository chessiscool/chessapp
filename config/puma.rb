<<<<<<< HEAD
<<<<<<< HEAD
# frozen_string_literal: true

=======
>>>>>>> 762ea5f5c6f95f9adf39127e991b29cee37821c7
=======
# frozen_string_literal: true

>>>>>>> 3e61dbe26a8e71d1481872f13e7fc6702703ee41
# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
<<<<<<< HEAD
<<<<<<< HEAD
threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests;
# default is 3000.
#
port        ENV.fetch('PORT') { 3000 }

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch('RAILS_ENV') { 'development' }
=======
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
=======
threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }
>>>>>>> 3e61dbe26a8e71d1481872f13e7fc6702703ee41
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests;
# default is 3000.
#
port        ENV.fetch('PORT') { 3000 }

# Specifies the `environment` that Puma will run in.
#
<<<<<<< HEAD
environment ENV.fetch("RAILS_ENV") { "development" }
>>>>>>> 762ea5f5c6f95f9adf39127e991b29cee37821c7
=======
environment ENV.fetch('RAILS_ENV') { 'development' }
>>>>>>> 3e61dbe26a8e71d1481872f13e7fc6702703ee41

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
