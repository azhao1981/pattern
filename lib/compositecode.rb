#--
# Copyright (c) 2010 weizhao
#
require File.dirname(__FILE__)+'/code'
require File.dirname(__FILE__)+'/command'

class CompositeCode < Code
  attr_accessor :codes
  
  def initialize(command)
  	@template_dir 	= command.template_dir
  	@classes 		= command.classes
  	@operations 	= command.operations
  	@target_dir 	= command.target_dir
  	@base_name		= command.base_name
  	
  	@template_files = Array.new
  	@template_replace_keys = Array.new
  	
  	@codes = []
  end  
  def load_readme
    eval(File.read( File.join(@template_dir,"readme") ))
  end
  
  def classes_to_codes
  	@classes = @classes || @default_classes
  	default_replace_values 	= get_default_replace_values
  	operations 				= @operations[0]
  	operations_template 	= File.open(File.join(@template_dir,"operations")).readlines.join
  	x = 0
  	
  	@classes.each do |template_classes|
  	  template 	= @template_files[x] || template
  	  key 		= @template_replace_keys[x] || key
  	  operations = @operations[x] || operations
  	  x+=1
  	  
  	  template_classes.each do |class_name|
  	  	replace_values = default_replace_values.clone
  	  	replace_values["#{key}"] = class_name
  	  	replace_values["operations"] = ""
  	    operations.each do |operation|
  	  	  replace_values["operations"] << operations_template.gsub("#operation#",operation) unless operation == " "
  	    end
  	    
  	    @codes << Code.new( template,
  	  						File.join(@target_dir,"#{class_name.downcase}#{File.extname(template)}"),
  	    					replace_values )
  	  end
  	end
  	return @codes
  end
  
  def get_default_replace_values
  	x = -1
  	default_replace_values = Hash.new
  	@template_replace_keys.each do |key|
  	  default_replace_values["#{key}"] = @classes[x+=1][0]
  	end
  	return default_replace_values
  end
  
  def template(template_name,replace_key)
  	@template_files << File.join(@template_dir,template_name)
  	@template_replace_keys << replace_key
  end
  def default(*classes_name)
  	@default_classes = [] 
  	classes_name.each do |class_name|
  	  @default_classes << [class_name]
  	end
  end
  def execute
  	load_readme
  	classes_to_codes
  	@codes.each { |code| code.execute }
  end
end

