#--
# Copyright (c) 2010 weizhao
#
class Code
  attr_accessor :template_file_name,:target_file_name,:replace_values
  def initialize(template_file_name,target_file_bame,replace_values)
  	@template_file_name =  template_file_name 
  	@target_file_name = target_file_bame
  	@replace_values = replace_values
  end
  def replace_template
  	template_string = File.open(@template_file_name).readlines.join
  	
  	@replace_values.each do |key,value|
  	  template_string = template_string.gsub("##{key}#",value)
  	end
  	return template_string
  end


  # add for test
  
  def generate_code
  	if File.exist?(@target_file_name)
  	  puts "* File #{@target_file_name} exist."
  	  return false
  	end
  	File.open(@target_file_name,"w") do |file|
  	  puts "* Create new file #{@target_file_name}."
  	  file.puts replace_template
  	end
  end
  
  def execute
  	generate_code
  end
end