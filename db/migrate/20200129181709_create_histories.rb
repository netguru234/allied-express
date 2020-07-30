class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.string :scan_history
      t.references :shipment, foreign_key: true

      t.timestamps
    end
  end
end
