if ENV['RUNNING_FROM'] && ENV['RUNNING_FROM'] == "PostResult"
$: << '../lib'
require 'post_result'
end

