class PeopleController < ApplicationController

  load_and_authorize_resource

  def index
    @people = @people.order(:name)
  end

  def show
    @evaluation_dates = @person.evaluation_dates

    show_evaluations_from = params[:date].nil?? @evaluation_dates.first : params[:date]
    @evaluations = EvaluationDecorator.decorate(@person.evaluations.for_date(show_evaluations_from))
  end
end