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

  def student_name
    model.student.name.titleize
  end

  def result
    if model.parser.total_grade.nil?
      %[<span class="label label-warning">#{h.t('evaluation.results.na')}</span>].html_safe
    else
      if model.parser.total_grade >= 7
        %[<span class="label label-success">#{h.t('evaluation.results.pass')}</span>].html_safe
      else
        %[<span class="label label-important">#{h.t('evaluation.results.failed')}</span>].html_safe
      end
    end
  end
end