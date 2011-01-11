require 'pathname'

module PathCommon
  PROJECT_DIR = "#{File.dirname(__FILE__)}/../"
  CONFIG_FILE = "#{PROJECT_DIR}etc/templates_path.conf"
  
  def absolute_path(path,dir=Dir.pwd)
  	Pathname.new(path).relative? ? File.expand_path(path,dir) : path
  end
  def parse_string(string)
  	string.split(';').collect { |classes| classes.split(',') }
  end
  def get_path
  	File.open(CONFIG_FILE).readlines.collect do |path|
  	  path = absolute_path(path.chomp,File.dirname(__FILE__))
  	end
  end
  def join(path,file=".")
  	File.join(path,file)
  end
end