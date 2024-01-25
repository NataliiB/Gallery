class CreateArticlesCategoriesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :articles, :categories
  end
end
