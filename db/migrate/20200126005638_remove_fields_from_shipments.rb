class RemoveFieldsFromShipments < ActiveRecord::Migration[5.0]
  def change
    remove_column :shipments, :statoption, :string
    remove_column :shipments, :weight, :string
    remove_column :shipments, :lastScan, :string
    remove_column :shipments, :status, :string
  end
end
