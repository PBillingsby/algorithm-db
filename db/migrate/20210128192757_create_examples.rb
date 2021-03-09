class CreateExamples < ActiveRecord::Migration[6.0]
  def change
    create_table :examples do |t|
      t.integer :user_id
      t.integer :algorithm_id
      t.string :language
      t.text :example

      t.timestamps
    end
  end
end
