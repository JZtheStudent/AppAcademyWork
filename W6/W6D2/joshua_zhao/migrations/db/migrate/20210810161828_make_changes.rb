class MakeChanges < ActiveRecord::Migration[5.2]
  def change
  
    change_table :restaurants do |t|
      t.rename :location, :address
      t.index :owner_id
    end

    change_table :users do |t|
      t.rename :passkey, :password
      t.remove :favorite_cuisine
    end

  end
end
