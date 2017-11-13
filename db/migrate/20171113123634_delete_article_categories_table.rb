class DeleteArticleCategoriesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :article_categories
  end
end
