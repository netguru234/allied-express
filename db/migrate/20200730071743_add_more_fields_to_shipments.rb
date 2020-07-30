class AddMoreFieldsToShipments < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :sender_address, :string
    add_column :shipments, :sender_phone, :string
    add_column :shipments, :sender_email, :string
    add_column :shipments, :receiver_address, :string
    add_column :shipments, :receiver_email, :string
    add_column :shipments, :receiver_phone, :string
  end
end
