class AddUserIdToTodo < ActiveRecord::Migration[7.0]
    def change
      add_column :todos, :user_id, :integer 
    end
end
