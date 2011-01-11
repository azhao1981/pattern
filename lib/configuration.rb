# config templates_path
# class Config is using

require File.dirname(__FILE__)+'/common'

class Configuration
  include PathCommon
  
  def initialize
  end 
  def add_path(path)
  	File.open(CONFIG_FILE,"a") do |file|
  	  path.each { |p| file.puts absolute_path(p) }
  	end
  	list_templates_path
  end
  def remove_path(path)
  	path_set = get_path - path.collect { |p| p= absolute_path(p) }
    File.open(CONFIG_FILE,"w") do |file|
      path_set.each { |p| file.puts p }
    end
    list_templates_path	
  end
  def list
  	list = []
  	get_path.uniq.each do |path|
  	  list += Dir.entries(path)
  	end
  	puts list-[".",".."]
  end
  def execute(argv)
  	parameters = argv[2..100] || [Dir.pwd]   	
  	action = argv[1]
  	add_path(parameters) if action=="add"
  	remove_path(parameters) if action == "remove"
  	get_default if action == "default"
  end
  def get_default
  	File.open(CONFIG_FILE,"w") do |file|
  	  file.puts "../templates"
  	end
  end
  def list_templates_path
  	puts "\nNow you get templates path:"
  	puts get_path
  end
end