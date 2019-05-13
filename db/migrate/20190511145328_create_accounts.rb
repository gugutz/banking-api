class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.integer :initial_balance, null: false
      t.integer :current_balance, null: false
      t.belongs_to :client, index: { unique: true }, foreign_key: true, null: false
      t.timestamps
    end
  end
end
