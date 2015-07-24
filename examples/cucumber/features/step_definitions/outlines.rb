Given(/^an (.*) of some description$/) do |item|
  
end

When(/^nothing happens$/) do
end

When(/^an exception happens$/) do
  raise "Exception!"
end

Given(/^something occurs$/) do
end

When(/^a non\-parametised step throws an exception$/) do
  raise "Exception from a non-parameterised step"
end

Then(/^the result is a fail$/) do
end

When(/^nought happens$/) do
end
