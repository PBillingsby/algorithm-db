class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.belongs_to :algorithm
      t.string :title
      t.text :article_content
    end
  end
end
