#--
# Copyright (c) 2010 weizhao
#
require File.dirname(__FILE__) + '/../lib/patterncode'
require File.dirname(__FILE__) + '/../lib/common'
include PathCommon

describe PatternCode do
  before(:each) do
  	template_file_name = absolute_path("../templates/ruby.composite/component.rb",File.dirname(__FILE__))
  	target_file_name = absolute_path("../temp/task",File.dirname(__FILE__))
  	@target_file_name_test = target_file_name
  	replace_values = {"class_name"=>"Task","operations"=>"  def execute\n  \t\n  end\n"}
  	@component_code = PatternCode.new(template_file_name,target_file_name,replace_values)	
  end
  it "1. replace_template should return template contain 'Task' & 'execute' " do
  	template = @component_code.replace_template
  	(/Task/ =~ template).should be > 0 
  	(/execute/ =~ template).should be > 0 
  end
  
  it "2. generate_code should create a new file" do
  	@component_code.generate_code
  	template = File.open(@target_file_name_test).readlines.join
  	(/Task/ =~ template).should be > 0 
  	(/execute/ =~ template).should be > 0
  end
  
  it "3. execute will do generate_code " do
  	@component_code.execute
  	template = File.open(@target_file_name_test).readlines.join
  	(/Task/ =~ template).should be > 0 
  	(/execute/ =~ template).should be > 0
  end
end