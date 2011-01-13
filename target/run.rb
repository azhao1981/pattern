#require "makecaketask"

#makecake = MakeCakeTask.new
#puts makecake.get_time_required


require "htmlreport"
require "plaintextreport"

HTMLReport.new.output_report
puts "--------------------"
PlainTextReport.new.output_report