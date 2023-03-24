# frozen_string_literal: true

begin
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new do |task|
    task.options = ['--parallel']
  end

  task :rubocop
rescue LoadError
  desc 'Rubocop is not available in production'
  task rubocop: :environment do
    abort 'Rubocop is not available in production'
  end
end
