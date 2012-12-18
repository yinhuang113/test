class CreateConnectorTypes < ActiveRecord::Migration
  def change
    create_table :connector_types do |t|
      t.string :name, null: false

      t.timestamps
    end
    ConnectorType.create(name: "Elevator")
    ConnectorType.create(name: "Escalator")
    ConnectorType.create(name: "Stairs")
  end
end
