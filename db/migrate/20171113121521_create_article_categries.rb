class CreateArticleCategries < ActiveRecord::Migration[5.1]
  def change
    create_table :article_categries do |t|
      t.integer :article_id
      t.integer :category_id
      t.timestamps 
    end
  end
end
