class ExamenVivosController < ApplicationController

  def new
    authorize! :create, Evaluation
    @evaluation = Evaluation.new
  end

  def create
    authorize! :create, Evaluation
    @evaluation = Evaluation.new(params[:evaluation])
    if @evaluation.valid?
      @person = Person.find_or_create_by_name(@evaluation.parser.student_name)
      # TODO check not to repeat evaluation
      @person.evaluations << @evaluation
      if @person.save
        redirect_to @person
      else
        render :action => "new"
      end
    else
      render :action => :new
    end
  end
end