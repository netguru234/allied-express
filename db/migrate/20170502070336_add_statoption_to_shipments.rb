class AddStatoptionToShipments < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :statoption, :string
  end
end
