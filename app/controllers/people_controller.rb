class PeopleController < ApplicationController

  def index
    @people = Person.order(:name).all
  end

  def show
    @person = Person.find(params[:id])
    @evaluation_dates = @person.evaluation_dates

    show_evaluations_from = params[:date].nil?? @evaluation_dates.first : params[:date]
    @evaluations = EvaluationDecorator.decorate(@person.evaluations.for_date(show_evaluations_from))
  end
end