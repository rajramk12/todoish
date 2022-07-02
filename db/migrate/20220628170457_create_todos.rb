class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :name 
      t.text :description
      t.date :start_dt
      t.date :end_dt
      t.boolean :iscompleted
      t.timestamps

    end
  end
end
