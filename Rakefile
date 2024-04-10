require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = Dir['spec/**/*_spec.rb']
end

task default: :spec

RuboCop::RakeTask.new do |task|
end
