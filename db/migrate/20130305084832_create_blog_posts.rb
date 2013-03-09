class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.integer :owner_id
      t.string :title
      t.text :body
      t.integer :likes

      t.timestamps
    end
  end
end
