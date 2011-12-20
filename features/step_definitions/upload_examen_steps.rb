Given /^(.*) (does|doesn't) exist$/ do |student_name, existance|
  case existance
    when "does"
      Person.find_or_create_by_name( student_name)
    when "doesn't"
      Person.where(:name => student_name).each(&:destroy)
  end
end

When /^I upload (.*\.xls)$/ do |file_name|
  visit new_examen_vivo_url
  attach_file 'evaluation_evaluation_file', "#{Rails.root}/spec/support/#{file_name}"
  click_button :commit
end

Then /^(.*) should be created$/ do |student_name|
  Person.find_by_name(student_name).should_not be_blank
end

Then /^evaluation should be embedded in (.*)$/ do |student_name|
  Person.find_by_name(student_name).evaluations.count.should == 1
end

When /^new person should not be created$/ do
  Person.count.should == 1
end