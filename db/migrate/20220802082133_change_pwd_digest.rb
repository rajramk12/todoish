class ChangePwdDigest < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :password, :password_digest
  end
end
