Given(/^everything passes$/) do
end

Then(/^I report a pass$/) do
end

Given(/^everything fails$/) do
  raise "I broken!"
end

Then(/^I report a fail$/) do
end

Given(/^most of the steps pass$/) do
end

Given(/^one step fails$/) do
  raise "I fail"
end
