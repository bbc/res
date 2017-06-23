When(/^I do true$/) do
  expect(true).to eq true
end

Then(/^I get true$/) do
  expect(true).to eq true
end

Then(/^I get false$/) do
  expect(true).to eq false
end

Given(/^I am testing first scenario$/) do
  expect(true).to eq true
end

Given(/^I am testing second scenario$/) do
  expect(true).to eq true
end

Given(/^I am testing third scenario$/) do
  expect(true).to eq true
end

Then(/^My test fail$/) do
  expect(true).to eq false
end

Then(/^My test pass$/) do
  expect(true).to eq true
end

Given(/^I am testing background$/) do
  expect(true).to eq true
end

When(/^background fail$/) do
  expect(true).to eq false
end

When(/^background pass$/) do
  expect(true).to eq true
end
