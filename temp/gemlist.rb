require "rubygems"

Gem::cache.each do |name,gem|
	puts "#{gem.name} (#{gem.version}) is installed."
end