class CreateBlogPostTagDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_post_tag_details do |t|
      t.references :blog_post, foreign_key: true
      t.references :blog_post_tag, foreign_key: true

      t.timestamps
    end
  end
end
