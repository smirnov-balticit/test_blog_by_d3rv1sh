class AddCategory < ActiveRecord::Migration
  def up
    add_column :blog_posts, :category_id, :integer
  end

  def down
    remove_column :blog_posts, :category_id
  end
end
