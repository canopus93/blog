class CreateBlogPostTags < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_post_tags do |t|
      t.references :blog_post, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
