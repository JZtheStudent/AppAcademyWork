class ChangeVideo < ActiveRecord::Migration[5.2]
  def change
    
    change_table :videos do |t|
      t.rename :name, :title
      t.index :uploader_id
    end

  end
end
