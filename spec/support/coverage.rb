require 'simplecov'

SimpleCov.start do
  project_name 'teresa'
  coverage_dir '.coverage'

  add_filter "/spec/"
  add_group 'Library', 'lib'
end
