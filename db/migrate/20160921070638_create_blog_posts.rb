class CreateBlogPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_posts do |t|
      t.string :title,    limit: 150
      t.string :summary,  limit: 250
      t.text :content
      t.string :title_image_url,  limit: 250
      t.references :user, foreign_key: true
      t.integer :view_count

      t.timestamps
    end
  end
end
