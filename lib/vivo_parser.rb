# encoding: UTF-8
require 'spreadsheet'

class VivoParser

  def initialize(file_path)
    begin
      @book = Spreadsheet.open(file_path)
    rescue RuntimeError
      return nil
    end
  end

  # ExamenVivo version of the loaded file
  # @return [String] version
  def version
    if @version.nil?
      @book.worksheet(0)[24,0].match(/(\d+)/)
      @version = $1.try(:to_i)
    end
    @version
  end

  # @return [String] student name
  def student_name
    @book.worksheet(1)[0,3]
  end

  # @return [String] students teacher name
  def students_teacher
    @book.worksheet(1)[1,3]
  end

  # @return [String] evaluator name
  def evaluator
    @book.worksheet(1)[5,3]
  end

  # @return [String] observations on ásana draw
  def draw_observations
    merge_range((16...36),2)
  end

  def coreography_observations
    merge_range(36...55,3)
  end

  # SWASTHYA_OBS_RANGES[:version][:anga]
  SWASTHYA_OBS_RANGES = {
      '10' =>  {
        :opening => 19...28,
        :mudra => 36...45,
        :puja => 53...62,
        :mantra => 69...78,
        :pranayama => 83...92,
        :kriya => 95...104,
        :asana => 123...132,
        :yoganidra => 139...148,
        :samyama => 151...160,
        :general => 197...206
    }
  }

  # @param [Hash] options
  # @option options :anga [String]
  # @return [String] observations
  def swasthya_observations(options={})
    anga = options[:anga]

    if anga.nil?
      SWASTHYA_OBS_RANGES["#{version}"].map{|k,v|"#{k}\n#{merge_range(v,4)}"}.join("\n")
    else
      merge_range(SWASTHYA_OBS_RANGES["#{version}"][anga.to_sym],4)
    end
  end

  # @return [String] beginners observations
  def beginners_observations
    merge_range(31...41,5)
  end

  # @return [String] disertation observations
  def disertation_observations
    merge_range(31...40,6)
  end

  private

  # Merges values of given range and joins
  # @param [Range] rows_range
  # @param [Integer/String] worksheet
  # @return [String] merged values
  def merge_range(rows_range, worksheet, join_with = "\n")
    # TODO if cel is a formula evaluate with .value
    rows_range.map{|i|@book.worksheet(worksheet)[i,0].try :strip}.join(join_with).gsub(/#{join_with}#{join_with}|#{join_with}$/,"")
  end
end