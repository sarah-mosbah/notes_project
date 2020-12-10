class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :body, null:false
      t.string :title, null: false
      t.integer :user_id, null:false
    end

    add_index :notes, :user_id
  end
end
