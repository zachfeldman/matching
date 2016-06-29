class AddDonationsTable < ActiveRecord::Migration
  def change
      create_table :donations do |t|
        t.string :gmail_id
        t.integer :donation_amount_in_cents
        t.string :donation_timestamp
        t.string :email
        t.timestamps
      end
  end
end
