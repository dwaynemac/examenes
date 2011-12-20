require "spec_helper"

describe PeopleController do

  describe "#show" do
    before do
      get :show, :id => Person.make.id
    end
    it { should respond_with :success }
  end


  describe "#index" do
    before do
      get :index
    end
    it { should respond_with :success }
    it { should assign_to(:people)}
  end
end