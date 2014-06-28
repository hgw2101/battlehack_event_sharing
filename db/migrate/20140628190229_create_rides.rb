class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :name
      t.belongs_to :user
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :total_cost

      t.timestamps
    end
  end
end
