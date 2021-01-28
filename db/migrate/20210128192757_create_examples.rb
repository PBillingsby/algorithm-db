class CreateExamples < ActiveRecord::Migration[6.0]
  def change
    create_table :examples do |t|
      t.string :language
      t.text :example

      t.timestamps
    end
  end
end
