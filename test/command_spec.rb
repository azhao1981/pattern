require File.dirname(__FILE__) + '/../lib/command'

describe Command do
  before(:each) do
  	params = "-t ruby.composite -c Task;compositeTask;AddDryIngredientsTask,MixTask;MakeBatterTask -op execute".split(" ")
  	@command = Command.new(params)
  end
  it "1. get_template_dir_from_params should return 'ruby.composite' " do
  	@command.get_template_dir_from_params.should == "ruby.composite"
  end
  it "2. get_templates_dirs should return ['../templates','../templates2']" do
  	@command.get_templates_dirs(@command.get_template_dir_from_params).should == 
  	                    ['E:/dev/easypattern/templates/ruby.composite',
  	                    'E:/dev/easypattern/templates2/ruby.composite']
  end
  it "3. Command.new should get right parameter form param" do
  	@command.template_dir.should == "E:/dev/easypattern/templates/ruby.composite"
  	@command.classes.should == [["Task"],["compositeTask"],
  	                                ["AddDryIngredientsTask","MixTask"],["MakeBatterTask"]]
  	@command.operations.should == [['execute']]  
  	@command.target_dir.should == "E:/dev/easypattern"	
  end
  it "4. absolute_path should return absolute path " do
  	@command.absolute_path("../templates/ruby.composite","./bin/../lib").should == "E:/dev/easypattern/templates/ruby.composite"
  end
end

