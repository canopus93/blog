class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name,	limit: 45
      t.string :email,	limit: 45
      t.string :password
      t.boolean :is_admin
      t.integer :activity_count


      t.timestamps
    end
  end
end
