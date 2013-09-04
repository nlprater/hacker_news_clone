class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      
      t.timestamps

      t.belongs_to :user
      t.belongs_to :post
    end
  end
end
