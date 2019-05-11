class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.integer :balance, null: false
      t.belongs_to :client, index: { unique: true }, foreign_key: true, null: false
      t.timestamps
    end
  end
end
