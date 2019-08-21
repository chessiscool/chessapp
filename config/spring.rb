<<<<<<< HEAD
# frozen_string_literal: true

=======
>>>>>>> 762ea5f5c6f95f9adf39127e991b29cee37821c7
%w[
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
].each { |path| Spring.watch(path) }
