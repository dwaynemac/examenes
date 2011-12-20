Then /^I should see message t\('(.*)'\)$/ do |i18n_key|
  page.should have_content I18n.t(i18n_key)
end