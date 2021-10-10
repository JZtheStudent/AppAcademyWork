class ChangeUser < ActiveRecord::Migration[5.2]
  def change
    
    change_table :users do |t|
      t.rename :email, :username
      t.remove :bio
    end

  end
end
