class RenameArticlesCategries < ActiveRecord::Migration[5.1]
  def change
    rename_table('article_categries', 'article_categories')
  end
end
