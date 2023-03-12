class AddJtiToUsers < ActiveRecord::Migration[7.0]
  def up 
    add_column :users, :jti, :string, null: false, default: ""
    add_index :users, :jti, unique: true
  end 

  def down
    remove_column :users, :jti
  end 

end
