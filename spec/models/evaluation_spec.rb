require 'spec_helper'

describe Evaluation do
  it { should belong_to :student }
  it { should belong_to :evaluator }

  it "should be valid with file not password protected" do
    valid = Evaluation.new(:evaluation_file => File.open("#{Rails.root}/spec/support/examen_vivo_no_pass.xls"))
    valid.should be_valid
  end

  it "should be invalid with file password protected" do
    invalid = Evaluation.new(:evaluation_file => File.open("#{Rails.root}/spec/support/examen_vivo_with_pass.xls"))
    invalid.should_not be_valid
  end

end