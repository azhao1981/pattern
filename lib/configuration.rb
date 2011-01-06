# config templates_path

require 'pathname'

class Configuration
  def initialize
  	@config_file = "#{File.dirname(__FILE__)}/../etc/templates_path.conf"
  end
  def get_path
  	File.open(@config_file).readlines.collect do |path|
  	  path = absolute_path(path.chomp,File.dirname(__FILE__))
  	end
  end
  def add_path(path)
  	File.open(@config_file,"a") do |file|
  	  path.each do |p|
  	  	file.puts absolute_path(p)
  	  end
  	end
  	puts "Now you get templates path:"
  	puts get_path
  end
  def remove_path(path)
  	puts "Now you remove templates path:"
  	puts path
  	path_set = get_path - path.collect { |p| p= absolute_path(p) }
    File.open(@config_file,"w") do |file|
      path_set.each do |p|
      	file.puts p
      end
    end
    puts "Now you get templates path:"
  	puts get_path	
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
  	File.open(@config_file,"w") do |file|
  	  file.puts "../templates"
  	end
  end
  def absolute_path(path,dir=Dir.pwd)
  	Pathname.new(path).relative? ? File.expand_path(path,dir) : path
  end
end