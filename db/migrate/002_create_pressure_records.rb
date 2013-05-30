migration 2, :create_pressure_records do
  up do
    create_table :pressure_records do
      column :id, Integer, :serial => true
      column :date, Date
      column :hour, Hour
      column :min, Integer
      column :max, Integer
    end
  end

  down do
    drop_table :pressure_records
  end
end
