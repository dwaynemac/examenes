class PeopleController < ApplicationController

  load_and_authorize_resource

  def index
    @people = @people.order(:name)
  end

  def show
    @evaluations = EvaluationDecorator.decorate(@person.evaluations)
  end
end