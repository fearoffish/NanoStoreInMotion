require "nano_store/version"

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

require 'bubble-wrap'

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'nano_store/*.rb')).each do |file|
    app.files.unshift(file)
  end

  app.files_dependencies(File.join(File.dirname(__FILE__), 'nano_store/model.rb') => 
    File.join(File.dirname(__FILE__), 'nano_store/finder.rb'))

  app.pods ||= Motion::Project::CocoaPods.new(app)
  app.pods.dependency 'NanoStore', '~> 2.0.1'
end