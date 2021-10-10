class ChangeUserAndVideo < ActiveRecord::Migration[5.2]
  def change
  
    change_table :users do |t|
      t.remove :bio
      t.rename :email, :username
    end

    change_table :videos do |t|
      t.index :uploader_id
      t.rename :name, :title
    end
  
  end
end
