class PeopleController < ApplicationController

  def index
    @people = Person.order(:name).all
  end

  def show
    @person = Person.find(params[:id])
  end
end