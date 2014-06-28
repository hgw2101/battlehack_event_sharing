class CreateLocationRecords < ActiveRecord::Migration
  def change
    create_table :location_records do |t|
      t.belongs_to :locatable
      t.point :location, :geographic => true
      t.string :type

      t.timestamps
    end

    change_table :location_records do |t|
      t.index :location, :spatial => true
    end
  end
end
