# commad for send parameter to CompositeCode
require "pathname"

class Command
  attr_accessor :template_dir,:target_dir,:classes,:operations,:base_name
  def initialize(params)
  	@params = params
  	get_template_dir
  	get_target_dir
  	get_classes
  	get_operations
  end
  def get_template_dir
  	get_templates_dirs(get_template_dir_from_params).each do |dir|
  	  @template_dir = dir if File.directory?(dir) 
  	end
  end
  def get_classes
  	classes = get_param("-c")
  	if classes
  	  @classes = parse_string( classes )
  	else
  	  @base_name = @params[1]
  	  @classes = nil
  	end
  end
  def get_operations
  	@operations = parse_string( operations = get_param("-op") || " " )
  end
  def get_templates_dirs(template)
  	File.open("#{File.dirname(__FILE__)}/../etc/templates_path.conf").readlines.collect do |line|
  		line = absolute_path(File.join(line.chomp,template),File.dirname(__FILE__))
  	end
  end
  def get_target_dir
  	@target_dir = absolute_path(get_param("-d") || ".")
  end
  def get_template_dir_from_params
  	return get_param("-t") || @params[0]
  end
  def get_param(option)
  	index = @params.index(option)
  	return index ? @params[index+1] : nil 
  end
  def absolute_path(path,dir=Dir.pwd)
  	Pathname.new(path).relative? ? File.expand_path(path,dir) : path
  end
  def parse_string(string)
  	string.split(';').collect { |classes| classes.split(',') }
  end
end