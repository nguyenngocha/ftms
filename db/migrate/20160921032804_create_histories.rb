class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.integer :owner_id
      t.string :owner_type
      t.string :action_type
      t.integer :target_id
      t.string :target_type
      t.integer :recipient_id
      t.string :recipient_type

      t.timestamps
    end
    add_index :histories, [:owner_id, :owner_type]
    add_index :histories, [:target_id, :target_type]
    add_index :histories, [:recipient_id, :recipient_type]
  end
end
