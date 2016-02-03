Given (/^I run my test$/) do
  
end

When (/^I capture some performance data$/) do
  require 'res'  
  Res.perf_data.push( { 'perf_parameter_1' => rand(100), 'perf_parameter_2' => rand(1) } )
end

Then (/^It should associate with the correct test in res$/) do
  
end
