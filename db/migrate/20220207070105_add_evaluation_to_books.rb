class AddEvaluationToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :evalution, :float
  end
end
