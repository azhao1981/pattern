require File.dirname(__FILE__) + '/../lib/compositecode'

describe CompositeCode do
  before(:each) do
  	params = "-t ruby.composite -d E:/dev/pattern/target -c Task;CompositeTask;AddDryIngredientsTask,MixTask;MakeBatterTask -op execute,test".split(" ")
  	@command = Command.new(params)
  	@target_dir = "E:/dev/pattern/target"
  	@compositecode = CompositeCode.new(@command)
  end
  it "1. classes_to_codes should return codes " do
  	@compositecode.load_readme
  	@compositecode.classes_to_codes.length.should == 5
  	code = @compositecode.codes[0]
  	code.template_file_name.should == "E:/dev/pattern/templates/ruby.composite/component.rb"
  	code.target_file_name.should == "E:/dev/pattern/target/task.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"AddDryIngredientsTask",
  	                                "composite_object_name"=>"MakeBatterTask",
  	                                "operations"=>"  def execute\n  \t\n  end\n  def test\n  \t\n  end\n"
                                   }
    code = @compositecode.codes[1]
  	code.template_file_name.should == "E:/dev/pattern/templates/ruby.composite/composite.rb"
  	code.target_file_name.should == "E:/dev/pattern/target/compositetask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"AddDryIngredientsTask",
  	                                "composite_object_name"=>"MakeBatterTask",
  	                                "operations"=>"  def execute\n  \t\n  end\n  def test\n  \t\n  end\n"
                                   }
    code = @compositecode.codes[2]
  	code.template_file_name.should == "E:/dev/pattern/templates/ruby.composite/leaf.rb"
  	code.target_file_name.should == "E:/dev/pattern/target/adddryingredientstask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"AddDryIngredientsTask",
  	                                "composite_object_name"=>"MakeBatterTask",
  	                                "operations"=>"  def execute\n  \t\n  end\n  def test\n  \t\n  end\n"
                                   }
    code = @compositecode.codes[3]
  	code.template_file_name.should == "E:/dev/pattern/templates/ruby.composite/leaf.rb"
  	code.target_file_name.should == "E:/dev/pattern/target/mixtask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"MixTask",
  	                                "composite_object_name"=>"MakeBatterTask",
  	                                "operations"=>"  def execute\n  \t\n  end\n  def test\n  \t\n  end\n"
                                   }
    code = @compositecode.codes[4]
  	code.template_file_name.should == "E:/dev/pattern/templates/ruby.composite/compositeobject.rb"
  	code.target_file_name.should == "E:/dev/pattern/target/makebattertask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"AddDryIngredientsTask",
  	                                "composite_object_name"=>"MakeBatterTask",
  	                                "operations"=>"  def execute\n  \t\n  end\n  def test\n  \t\n  end\n"
                                   }            
  end
  it "2. default params should return base_name and default_classes " do
  	params = "ruby.composite Task -d E:/dev/pattern/target".split(" ")
  	@compositecode = CompositeCode.new(Command.new(params))
  	@compositecode.load_readme
  	@compositecode.classes_to_codes.length.should == 4
  	code = @compositecode.codes[0]
  	code.template_file_name.should == "E:/dev/pattern/templates/ruby.composite/component.rb"
  	code.target_file_name.should == "E:/dev/pattern/target/task.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"LeafTask",
  	                                "composite_object_name"=>"CompositeObjectTask",
  	                                "operations"=>""
                                   }
    code = @compositecode.codes[1]
  	code.template_file_name.should == "E:/dev/pattern/templates/ruby.composite/composite.rb"
  	code.target_file_name.should == "E:/dev/pattern/target/compositetask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"LeafTask",
  	                                "composite_object_name"=>"CompositeObjectTask",
  	                                "operations"=>""
                                   }
    code = @compositecode.codes[2]
  	code.template_file_name.should == "E:/dev/pattern/templates/ruby.composite/leaf.rb"
  	code.target_file_name.should == "E:/dev/pattern/target/leaftask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"LeafTask",
  	                                "composite_object_name"=>"CompositeObjectTask",
  	                                "operations"=>""
                                   }
    code = @compositecode.codes[3]
  	code.template_file_name.should == "E:/dev/pattern/templates/ruby.composite/compositeobject.rb"
  	code.target_file_name.should == "E:/dev/pattern/target/compositeobjecttask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"LeafTask",
  	                                "composite_object_name"=>"CompositeObjectTask",
  	                                "operations"=>""
                                   }        
  end
  
end










