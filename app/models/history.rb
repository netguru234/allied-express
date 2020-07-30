class History < ApplicationRecord
  belongs_to :shipment
  validates :scan_history, presence: true
end
