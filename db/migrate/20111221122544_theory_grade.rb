class TheoryGrade < ActiveRecord::Migration
  def change
    add_column :evaluations, :theory_grade, :float
  end
end
