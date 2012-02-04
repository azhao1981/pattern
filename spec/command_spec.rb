require File.dirname(__FILE__) + '/../lib/command'
require File.dirname(__FILE__)+'/../lib/common'

describe Command do
  include PathCommon
  before(:each) do
  	params = "-t ruby.composite -c Task;compositeTask;AddDryIngredientsTask,MixTask;MakeBatterTask -op execute".split(" ")
  	@command = Command.new(params)
    @project_dir = File.expand_path(PROJECT_DIR)
  end
  it "1. Command.new should get right parameter form param" do
  	@command.template_dir.should == "#{@project_dir}/templates/ruby.composite"
  	@command.classes.should == [["Task"],["compositeTask"],
  	                                ["AddDryIngredientsTask","MixTask"],["MakeBatterTask"]]
  	@command.operations.should == [['execute']]  
  	@command.target_dir.should == @project_dir	
  end
  it "2. absolute_path should return absolute path " do
  	@command.absolute_path("../templates/ruby.composite","./bin/../lib").should == "#{@project_dir}/templates/ruby.composite"
  end
end

