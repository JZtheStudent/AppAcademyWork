class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :video_id, null: false 
      t.integer :commenter_id, null: false 
      t.integer :parent_comment_id

      t.timestamps
    end
  
    add_index :comments, :video_id, unique: true 
    add_index :comments, :commenter_id, unique: true
    add_index :comments, :parent_comment_id, unique: true

  end
end
