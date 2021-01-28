class CreateAlgorithms < ActiveRecord::Migration[6.0]
  def change
    create_table :algorithms do |t|
      t.string :name
      t.string :runtime
      t.string :worst_case
      t.string :best_case
      t.text :steps

      t.timestamps
    end
  end
end
