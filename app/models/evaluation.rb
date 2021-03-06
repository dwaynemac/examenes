##
# Representa la evaluación de 1 evaluador a 1 evaluado.
#
class Evaluation < ActiveRecord::Base

  # Es el archivo de la evaluación. El examen_vivo.xls
  mount_uploader :evaluation_file, EvaluationFileUploader
  validates_presence_of :evaluation_file
  validate :file_is_readable

  before_validation :cache_values_in_db

  belongs_to :student, :class_name => 'Person', :foreign_key => :student_id
  belongs_to :evaluator, :class_name => "Person", :foreign_key => "evaluator_id"

  validate :three_evaluations_per_date
  validate :one_evaluation_per_evaluator_per_date

  # secciones de una evaluacion
  SECTIONS = %W(draw coreography swasthya beginners disertation)

  # partes evaluadas en la clase de swasthya
  ANGAS = %W[opening mudra puja mantra pranayama kriya asana yoganidra samyama general]

  # Scopes to a date.
  def self.for_date(filter_date)
    self.where(:date => filter_date)
  end

  # Access to library that reads the evaluation_file
  # @return [VivoParser]
  def parser
    return nil if self.evaluation_file.nil?
    VivoParser.new(self.evaluation_file.path)
  end

  private
  def three_evaluations_per_date
    return if self.student.nil?
    unless self.student.evaluations.where(:date => self.date).count < 3
      self.errors.add(:date, I18n.t('evaluation.errors.max_evaluation_per_date_achieved'))
    end
  end

  def one_evaluation_per_evaluator_per_date
    return if self.student.nil?
    unless self.student.evaluations.where(:date => self.date, :evaluator_id => self.evaluator.id).count == 0
      self.errors.add(:evaluator, I18n.t('evaluation.errors.one_evaluation_per_evaluator'))
    end
  end

  # Validates that evaluation_file is readable
  def file_is_readable
    unless self.parser.readable?
      self.errors.add(:evaluation_file, I18n.t('evaluation.errors.file_not_readable'))
    end
  end

  def cache_values_in_db
    return unless self.parser.readable?
    self.date      = self.parser.date
    self.student   = Person.find_or_create_by_name(self.parser.student_name) if self.student.nil?
    self.evaluator = Person.find_or_create_by_name(self.parser.evaluator)    if self.evaluator.nil?
  end

end