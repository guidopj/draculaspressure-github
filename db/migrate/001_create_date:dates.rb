migration 1, :create_date:dates do
  up do
    create_table :date:dates do
      column :id, Integer, :serial => true
      column :hour, Hour
      column :min, Integer
      column :max, Integer
    end
  end

  down do
    drop_table :date:dates
  end
end
