class AddPwdTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users,:password,  :string
    add_column :users,:salt, :string
    add_column :users,:isadmin, :boolean
  end
end
