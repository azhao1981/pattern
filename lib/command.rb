# commad for send parameter to CompositeCode
# PathCommon is in common.rb

require File.dirname(__FILE__)+'/common'

class Command
  include PathCommon
  attr_accessor :template_dir,:target_dir,:classes,:operations,:base_name
  
  def initialize(params)
  	@params = params
  	get_template_dir
  	get_target_dir
  	get_classes
  	get_operations
  end
  def get_template_dir
  	template = get_param("-t") || @params[0]
  	get_templates(template).each do |dir|
  	  @template_dir = dir if File.directory?(dir) 
  	end
  end
  def get_target_dir
  	@target_dir = absolute_path(get_param("-d") || ".")
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
  
private  
  def get_templates(template)
    get_path.collect { |dir| dir = join(dir,template) }
  end
  def get_param(option)
  	index = @params.index(option)
  	return index ? @params[index+1] : nil 
  end
end