migration 2, :create_blood_pressures do
  up do
    create_table :blood_pressures do
      column :id, Integer, :serial => true
      column :max, Integer
      column :min, Integer
      column :date, DateTime
    end
  end

  down do
    drop_table :blood_pressures
  end
end
