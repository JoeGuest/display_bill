Given(/^user is viewing their Sky bill$/) do
  visit('/')
end

Then(/^they can see their statement$/) do
   expect(page).to have_content("Statement")
end

And(/^their bills total$/) do
   expect(page).to have_content("Total")
end

And(/^their subscription package$/) do
   expect(page).to have_content("Package")
end

And(/^their call charges$/) do
   expect(page).to have_content("Call Charges")
end

And(/^their SkyStore details$/) do
   expect(page).to have_content("Sky Store")
end
