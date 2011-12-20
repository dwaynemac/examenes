class Person < ActiveRecord::Base

  validates_presence_of :name

  # person was the student in these evaluations
  has_many :evaluations, :foreign_key => :student_id

  # person was the evaluator in these evaluations
  has_many :evaluated, :foreign_key => :evaluator_id
end