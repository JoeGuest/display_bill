Given(/^user is viewing their Sky bill$/) do
  visit('/')
end

Then(/^they can see their statement$/) do
   expect(page).to have_content("statement")
end

And(/^their bills total$/) do
   expect(page).to have_content("total")
end

And(/^their subscription package$/) do
   expect(page).to have_content("package")
end

And(/^their call charges$/) do
   expect(page).to have_content("callCharges")
end

And(/^their SkyStore details$/) do
   expect(page).to have_content("skyStore")
end
