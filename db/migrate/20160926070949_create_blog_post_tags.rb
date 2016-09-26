class CreateBlogPostTags < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_post_tags do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
