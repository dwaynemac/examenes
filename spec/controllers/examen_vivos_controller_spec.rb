require 'spec_helper'

describe ExamenVivosController do
  describe "#create" do
    context "exam of an existing student" do
      before do
        @p = Person.make(name: "Laura Ciuffo")
        post :create,
             :evaluation => {
                 :evaluation_file => fixture_file_upload("#{Rails.root}/spec/support/examen_vivo_no_pass.xls")}
      end
      it { should redirect_to @p }
      it "should create evaluation on student" do
        @p.evaluations.count.should == 1
      end
      it "should not create person" do
        Person.where(name: "Laura Ciuffo").count.should == 1
      end
    end
    context "exam of a non-existant student" do
      before do
        Person.where(name: "Laura Ciuffo").each(&:destroy)
        post :create,
             :evaluation => {
                 :evaluation_file => fixture_file_upload("#{Rails.root}/spec/support/examen_vivo_no_pass.xls")}
      end
      it { should redirect_to assigns(:person) }
      it "should create evaluation on student" do
        assigns(:person ).evaluations.count.should == 1
      end
      it "should create person" do
        Person.where(name: "Laura Ciuffo").count.should == 1
      end
    end
    context "password protected exam" do
      before do
        @response = post :create,
             :evaluation => {
                 :evaluation_file => fixture_file_upload("#{Rails.root}/spec/support/examen_vivo_with_pass.xls")}
      end
      it { should respond_with :success }
    end
  end
end