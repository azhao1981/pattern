#require "task"
#require "compositetask"
#require "adddryingredientstask"
#require "mixtask"
#require "addliquidstask"
#require "makebattertask"
require "makecaketask"

makecake = MakeCakeTask.new
puts makecake.get_time_required