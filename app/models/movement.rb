class Movement < ApplicationRecord
  belongs_to :product
  MovementTypes = { add: 0, remove: 1 }
  validates :quantity, presence: true, numericality: true

  def self.get_movement_types
    {
      "Add" => MovementTypes[:add],
      "Remove" => MovementTypes[:remove]
    }
  end

  def movement_type_name
    return "Add" if self.movement_type == MovementTypes[:add]
    return "Remove" if self.movement_type == MovementTypes[:remove]
  end
end
