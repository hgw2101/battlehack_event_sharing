class ChangeTypeInLocationRecords < ActiveRecord::Migration
  def change
    rename_column :location_records, :type, :description
  end
end
