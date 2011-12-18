# encoding: UTF-8
require 'spec_helper'

SWASTHYA_OBS = {
    opening: "No ofrecio Kamala y no encendio kalidanda",
    mudra: "musica muy baja",
    puja: "La musica muy baja.\nLa inducion fue muy rapida",
    mantra: "Japa muy alto.",
    pranayama: "Generar mas clima para que el alumno se conecte con el pránáypama",
    kriya: "camina un poco mas dando la sensacion de mas preciencia",
    asana: "Corregir haciendole saber al alumno que puede abanzar un poco mas, aplicar mas seguridad al corregir",
    yoganidra: "Cuidar algunas expresiones: Colocan algunas exalaciones mas lentas?",
    samyama: "obs de samyama",
    general: "Transmitir mas seguridad al grupo para dar mas fuerza la practica.\nHacercarse mas alumno nuevo y dar mas variantes para todos"
}

describe VivoParser do

  describe ".new" do
    context "when file is password protected" do
      before do
        file_path = "#{Rails.root}/spec/support/examen_vivo_with_pass.xls"
        @parser = VivoParser.new(file_path)
      end
      it "returns nil" do
        @parse.should be_nil
      end
    end

    context "when file is now password protected" do
      before do
        file_path = "#{Rails.root}/spec/support/examen_vivo_no_pass.xls"
        @parser = VivoParser.new(file_path)
      end
      it "opens successfully" do
        @parser.should be_a(VivoParser)
      end
    end
  end

  context "on valid file" do
    before do
      file_path = "#{Rails.root}/spec/support/examen_vivo_no_pass.xls"
      @parser = VivoParser.new(file_path)
    end

    specify "#version returns version of opened file" do
      @parser.version.should == 10
    end

    specify "#student_name returns student name" do
      @parser.student_name.should == "Laura Ciuffo"
    end

    specify "#students_teacher returns students teacher" do
      @parser.students_teacher.should == "Diego Ouje"
    end

    specify "#evaluator returns evaluator name" do
      @parser.evaluator.should == "David Uriz"
    end

    specify "#draw_observations returns observations made on Ásana draw" do
      @parser.draw_observations.should == "no hubo\nobservaciones\nen este examen"
    end

    specify "#coreography_observations returns observations made on Coregraphy" do
      @parser.coreography_observations.should == "observaciones\nde la coreografía"
    end

    specify "#beginners_observations returns observations for beginners class" do
      @parser.beginners_observations.should == "observacion de iniciantes"
    end

    specify "#disertation_observations returns disertation observations" do
      @parser.disertation_observations.should == "observaciones Generales\nde la disertación"
    end

    describe "swasthya_observations" do

      it "returns all observations of swásthya class" do
        @parser.swasthya_observations.should == SWASTHYA_OBS.map{|k,v|"#{k}\n#{v}"}.join("\n")
      end

      context "with option :anga it returns only such anga" do
        SWASTHYA_OBS.each do |k,v|
          specify "anga: #{k} returns only such observations" do
            @parser.swasthya_observations(anga: k).should == v
          end
        end
      end
    end
  end
end
