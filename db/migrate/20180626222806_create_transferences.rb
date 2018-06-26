class CreateTransferences < ActiveRecord::Migration[5.2]
  def change
    create_table :transferences do |t|
      t.decimal :amount
      t.integer :account_source_id
      t.integer :account_destination_id

      t.timestamps
    end
  end
end
