# This is code of composite pattern . Generated by easypattern.
# 
require "compositetask"
require "makebattertask"

class MakeCakeTask < CompositeTask
  def initialize
  	super("makecaketask")
  	#ToDo :add sub class
  	add_sub_task(MakeBatterTask.new)
  end
end