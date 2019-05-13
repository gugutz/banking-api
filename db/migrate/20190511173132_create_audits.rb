class CreateAudits < ActiveRecord::Migration[5.2]
  def change
    create_table :audits do |t|
      t.references :client
      t.references :source_account, class_name: 'Account'
      t.references :destination_account, class_name: 'Account'
      t.integer :amount

      t.timestamps
    end

  end
end
