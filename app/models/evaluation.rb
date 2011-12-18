class Evaluation
  include Mongoid::Document

  mount_uploader :file, EvaluationFileUploader
end