# encoding: utf-8

class EvaluationFileUploader < CarrierWave::Uploader::Base


  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
     %w(xls)
  end

end
