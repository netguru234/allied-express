class RenameShipmentTrackingNumberToTrackingnumber < ActiveRecord::Migration[5.0]
  def change
  	rename_column :shipments, :trackingNumber, :trackingnumber
  end
end
