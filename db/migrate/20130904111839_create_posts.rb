class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      
      t.timestamps

      t.belongs_to :user
    end
  end
end
