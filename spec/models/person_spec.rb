require 'spec_helper'

describe Person do

  it { should validate_presence_of :name }
  it { should have_many(:evaluations) }
  it { should have_many(:evaluated) }

  describe "#evaluation_dates" do
    before do
      @p = Person.make

      e = Evaluation.new
      e.parser = mock(:readable? => true,
                      :student_name => @p.name,
                      :evaluator => Faker::Name.first_name,
                      :date => Date.civil(2010,1,1))

      @p.evaluations << e
      @p.save
    end

    it "should return dates with evaluation" do
      @p.evaluation_dates.count.should == 1
      @p.evaluation.dates.first.should == Date.civil(2010,1,1)
    end
  end
end