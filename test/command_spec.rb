require File.dirname(__FILE__) + '/../lib/command'

describe Command do
  before(:each) do
  	params = "-t ruby.composite -c Task;compositeTask;AddDryIngredientsTask,MixTask;MakeBatterTask -op execute".split(" ")
  	@command = Command.new(params)
  end
  it "1. Command.new should get right parameter form param" do
  	@command.template_dir.should == "E:/dev/pattern/templates/ruby.composite"
  	@command.classes.should == [["Task"],["compositeTask"],
  	                                ["AddDryIngredientsTask","MixTask"],["MakeBatterTask"]]
  	@command.operations.should == [['execute']]  
  	@command.target_dir.should == "E:/dev/pattern"	
  end
  it "2. absolute_path should return absolute path " do
  	@command.absolute_path("../templates/ruby.composite","./bin/../lib").should == "E:/dev/pattern/templates/ruby.composite"
  end
end

