require "faker"
require "machinist"
require "machinist/active_record"

Evaluation.blueprint do
  evaluation_file { File.open("#{Rails.root}/spec/support/examen_vivo_no_pass.xls")}
end

Person.blueprint do
  name { Faker::Name.first_name}
end