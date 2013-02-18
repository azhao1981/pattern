module Pattern
  module VERSION #:nodoc:
    MAJOR = 0
    MINOR = 9
    TINY  = 7

    STRING = [MAJOR, MINOR, TINY].join('.')
  end
  module HELP
  	STRING = <<-EOF
pattern is a tool for coding/learning pattern/data structure.
Usage:
	pattern -h/--help
	pattern -v/--version
	pattern -l/--list
	pattern -s/--set [add/remove/default] [template_dir]
	pattern [tempate_dir] [main_class_name] [-d target_dir]
	pattern [-t tempate_dir] [-d target_dir("." is default)] [-c classes_name] [-op operations_name]
Examples:
	pattern -l						List template you get
	pattern -s add .				Add current dir as templates path
	pattern ruby.composite Task		Generate a composite pattern ,which base class name as Task
	pattern -t ruby.composite -d E:/dev/pattern/target -c Task;CompositeTask;AddDryIngredientsTask,MixTask;MakeBatterTask -op execute,test
Further  Help:
Further information:
	https://github.com/azhao1981/pattern	  	
  	EOF
  	WELLCOME = <<-EOF
Thanks for using pattern beta.Q&Ideas Mailto:azhao.1981@gmail.com
  	EOF
  end
end
