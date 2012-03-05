class EvaluationsController < ApplicationController

  load_and_authorize_resource

  def show
    @evaluation = EvaluationDecorator.decorate(@evaluation)
  end
end
