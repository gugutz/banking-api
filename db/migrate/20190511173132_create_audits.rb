class CreateAudits < ActiveRecord::Migration[5.2]
  def change
    create_table :audits do |t|
      t.string :user
      t.integer :source_account_id
      t.integer :destination_account_id
      t.integer :amount

      t.timestamps
    end
  end
end
