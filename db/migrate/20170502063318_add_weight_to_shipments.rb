class AddWeightToShipments < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :weight, :string
  end
end
