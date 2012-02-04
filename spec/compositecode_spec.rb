require File.dirname(__FILE__) + '/../lib/compositecode'
require File.dirname(__FILE__)+'/../lib/common'

describe CompositeCode do
  include PathCommon
  before(:each) do
    @target_dir = absolute_path("target",PROJECT_DIR)
    @project_dir = File.expand_path(PROJECT_DIR)
  	params = "-t ruby.composite -d #{@target_dir} -c Task;CompositeTask;AddDryIngredientsTask,MixTask;MakeBatterTask -op execute,test".split(" ")
  	@command = Command.new(params)
  	
  	@compositecode = CompositeCode.new(@command)
  end
  it "1. classes_to_codes should return codes " do
  	@compositecode.load_readme
  	@compositecode.classes_to_codes.length.should == 5
  	code = @compositecode.codes[0]
  	code.template_file_name.should == "#{@project_dir}/templates/ruby.composite/component.rb"
  	code.target_file_name.should == "#{@project_dir}/target/task.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"AddDryIngredientsTask",
  	                                "composite_object_name"=>"MakeBatterTask",
  	                                "lc_class_name"=>"task","lc_composite_name"=>"compositetask",
  									"lc_leaf_name"=>"adddryingredientstask",
  	                                "lc_composite_object_name"=>"makebattertask",
  	                                "operations"=>"  def execute\n  \t\n  end\n  def test\n  \t\n  end\n"
                                   }
    code = @compositecode.codes[1]
  	code.template_file_name.should == "#{@project_dir}/templates/ruby.composite/composite.rb"
  	code.target_file_name.should == "#{@project_dir}/target/compositetask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"AddDryIngredientsTask",
  	                                "composite_object_name"=>"MakeBatterTask",
  	                                "lc_class_name"=>"task","lc_composite_name"=>"compositetask",
  									"lc_leaf_name"=>"adddryingredientstask",
  	                                "lc_composite_object_name"=>"makebattertask",
  	                                "operations"=>"  def execute\n  \t\n  end\n  def test\n  \t\n  end\n"
                                   }
    code = @compositecode.codes[2]
  	code.template_file_name.should == "#{@project_dir}/templates/ruby.composite/leaf.rb"
  	code.target_file_name.should == "#{@project_dir}/target/adddryingredientstask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"AddDryIngredientsTask",
  	                                "composite_object_name"=>"MakeBatterTask",
  	                                "lc_class_name"=>"task","lc_composite_name"=>"compositetask",
  									"lc_leaf_name"=>"adddryingredientstask",
  	                                "lc_composite_object_name"=>"makebattertask",
  	                                "operations"=>"  def execute\n  \t\n  end\n  def test\n  \t\n  end\n"
                                   }
    code = @compositecode.codes[3]
  	code.template_file_name.should == "#{@project_dir}/templates/ruby.composite/leaf.rb"
  	code.target_file_name.should == "#{@project_dir}/target/mixtask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"MixTask",
  	                                "composite_object_name"=>"MakeBatterTask",
  	                                "lc_class_name"=>"task","lc_composite_name"=>"compositetask",
  									"lc_leaf_name"=>"mixtask",
  	                                "lc_composite_object_name"=>"makebattertask",
  	                                "operations"=>"  def execute\n  \t\n  end\n  def test\n  \t\n  end\n"
                                   }
    code = @compositecode.codes[4]
  	code.template_file_name.should == "#{@project_dir}/templates/ruby.composite/compositeobject.rb"
  	code.target_file_name.should == "#{@project_dir}/target/makebattertask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"AddDryIngredientsTask",
  	                                "composite_object_name"=>"MakeBatterTask",
  	                                "lc_class_name"=>"task","lc_composite_name"=>"compositetask",
  									"lc_leaf_name"=>"adddryingredientstask",
  	                                "lc_composite_object_name"=>"makebattertask",
  	                                "operations"=>"  def execute\n  \t\n  end\n  def test\n  \t\n  end\n"
                                   }            
  end
  it "2. default params should return base_name and default_classes " do
  	params = "ruby.composite Task -d #{@project_dir}/target".split(" ")
  	@compositecode = CompositeCode.new(Command.new(params))
  	@compositecode.load_readme
  	@compositecode.classes_to_codes.length.should == 4
  	code = @compositecode.codes[0]
  	code.template_file_name.should == "#{@project_dir}/templates/ruby.composite/component.rb"
  	code.target_file_name.should == "#{@project_dir}/target/task.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"LeafTask",
  	                                "composite_object_name"=>"CompositeObjectTask",
  	                                "lc_class_name"=>"task","lc_composite_name"=>"compositetask",
  									"lc_leaf_name"=>"leaftask",
  	                                "lc_composite_object_name"=>"compositeobjecttask",
  	                                "operations"=>""
                                   }
    code = @compositecode.codes[1]
  	code.template_file_name.should == "#{@project_dir}/templates/ruby.composite/composite.rb"
  	code.target_file_name.should == "#{@project_dir}/target/compositetask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"LeafTask",
  	                                "composite_object_name"=>"CompositeObjectTask",
  	                                "lc_class_name"=>"task","lc_composite_name"=>"compositetask",
  									"lc_leaf_name"=>"leaftask",
  	                                "lc_composite_object_name"=>"compositeobjecttask",
  	                                "operations"=>""
                                   }
    code = @compositecode.codes[2]
  	code.template_file_name.should == "#{@project_dir}/templates/ruby.composite/leaf.rb"
  	code.target_file_name.should == "#{@project_dir}/target/leaftask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"LeafTask",
  	                                "composite_object_name"=>"CompositeObjectTask",
  	                                "lc_class_name"=>"task","lc_composite_name"=>"compositetask",
  									"lc_leaf_name"=>"leaftask",
  	                                "lc_composite_object_name"=>"compositeobjecttask",
  	                                "operations"=>""
                                   }
    code = @compositecode.codes[3]
  	code.template_file_name.should == "#{@project_dir}/templates/ruby.composite/compositeobject.rb"
  	code.target_file_name.should == "#{@project_dir}/target/compositeobjecttask.rb"
  	code.replace_values.should == {"class_name"=>"Task","composite_name"=>"CompositeTask",
  									"leaf_name"=>"LeafTask",
  	                                "composite_object_name"=>"CompositeObjectTask",
  	                                "lc_class_name"=>"task","lc_composite_name"=>"compositetask",
  									"lc_leaf_name"=>"leaftask",
  	                                "lc_composite_object_name"=>"compositeobjecttask",
  	                                "operations"=>""
                                   }        
  end
  
end










