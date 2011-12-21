class EvaluationDecorator < ApplicationDecorator
  decorates :evaluation

  def date
    formatted_timestamp(model.date)
  end

  def total_grade
    h.number_with_precision model.parser.total_grade, precision: 2
  end

  def evaluator_name
    model.evaluator.name.titleize
  end
end