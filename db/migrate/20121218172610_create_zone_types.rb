class CreateZoneTypes < ActiveRecord::Migration
  def change
    create_table :zone_types do |t|
      t.string :name

      t.timestamps
    end
    
    ZoneType.create(name: "ATM")
    ZoneType.create(name: "Play Area")
    ZoneType.create(name: "Security")
    ZoneType.create(name: "Restroom")
    ZoneType.create(name: "Stroller Rental")
    ZoneType.create(name: "Food Court")
    ZoneType.create(name: "Pay Phone")
    ZoneType.create(name: "Bus")
    ZoneType.create(name: "Train")
    ZoneType.create(name: "Customer Service")
  end
end
