class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :tags
      t.boolean :visible

      t.timestamps
    end
  end
end
