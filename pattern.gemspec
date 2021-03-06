require 'rake'
require(File.expand_path('lib/version', File.dirname(__FILE__))) 

Gem::Specification.new do |spec|
#-----------------------------
#  Package information
#-----------------------------
	spec.name = 'pattern'
	spec.version = Pattern::VERSION::STRING
	spec.executables << 'pattern'
	spec.has_rdoc = true
	spec.rdoc_options << '--title' << 'Pattern' <<
	                       '--line-numbers'
	spec.rubyforge_project = 'pattern'
	spec.homepage = 'https://github.com/azhao1981/pattern'
	spec.files = FileList['lib/*.rb', 'bin/*', '[A-Z]*', 'test/*','templates/**/*','etc/*','docs/*'].to_a
	spec.test_files = Dir.glob('test/*_spec.rb')
	spec.summary = 'auto code tools.'
	spec.description = <<-EOF
	  Tool for coding/learning pattern/data structure
	EOF
#-----------------------------
#  Author information
#-----------------------------
	spec.author = 'weizhao'
	spec.email = 'azhao.1981@gmail.com'
end

