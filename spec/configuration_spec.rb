require File.dirname(__FILE__) + '/../lib/configuration'

describe Configuration do
  before(:each) do
  	@configuration = Configuration.new
  	@configuration.get_default
  end
  after(:each) do
  	@configuration.get_default
  end
  it "1. get_path should return current path " do
  	@configuration.get_path[0].should == "E:/dev/pattern/templates"
  	@configuration.get_path.length == 1
  end
  it "2. add_path should add a path into configuration" do
  	@configuration.add_path(["E:/dev/pattern/templates2","E:/dev/pattern/templates3"])
  	@configuration.get_path[0].should == "E:/dev/pattern/templates"
  	@configuration.get_path[1].should == "E:/dev/pattern/templates2"
  	@configuration.get_path[2].should == "E:/dev/pattern/templates3"
  	@configuration.get_path.length == 3
  end
  it "3. remove_path should remove a path form configuration" do
  	@configuration.add_path(["E:/dev/pattern/templates2","E:/dev/pattern/templates3"])
  	@configuration.remove_path(["E:/dev/pattern/templates2"])
  	@configuration.get_path[1].should == "E:/dev/pattern/templates3"
  	@configuration.get_path.length == 2
  end
end