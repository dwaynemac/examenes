class EvaluationDate < ActiveRecord::Migration
  def change
    add_column :evaluations, :date, :date
  end
end
