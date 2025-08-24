require 'csv'

class Product < ApplicationRecord
    has_many :movements
    validates :name, presence: true
    validates :reference, presence: true, uniqueness: true
    validates :description, presence: true

    def quantity
        total = 0
        self.movements.each do |movement|
            if movement.movement_type == Movement::MovementTypes[:add]
                total += movement.quantity
            elsif movement.movement_type == Movement::MovementTypes[:remove]
                total -= movement.quantity
            end
        end
        return total
    end

     def self.to_csv(records)
    attributes = %w{id name reference description created_at updated_at}

    ::CSV.generate(headers: true) do |csv|
      csv << attributes

      Array(records).each do |product|
        csv << attributes.map { |attr| product.send(attr) }
      end
    end
  end
end
