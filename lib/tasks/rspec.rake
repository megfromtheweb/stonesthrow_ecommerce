# frozen_string_literal: true

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:rspec)
rescue LoadError
  desc 'RSpec is not available in production'
  task rspec: :environment do
    abort 'RSpec is not available in production'
  end
end
