def require_r(path)	require(File.expand_path(path.to_s, File.dirname(__FILE__))) end

require_r '../lib/code'

puts Code.new.to_s
