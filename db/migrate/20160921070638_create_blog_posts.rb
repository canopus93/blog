class CreateBlogPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_posts do |t|
      t.string :title,    limit: 45
      t.string :summary,  limit: 150
      t.text :content
      t.string :title_image_url,  limit: 150
      t.references :user, foreign_key: true
      t.integer :view_count

      t.timestamps
    end
  end
end
