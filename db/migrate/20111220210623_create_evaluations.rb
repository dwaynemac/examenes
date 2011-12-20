class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.float  :total_grade
      t.string :evaluation_file
      t.references :student
    end
  end
end
