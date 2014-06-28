class CreateUserRides < ActiveRecord::Migration
  def change
    create_table :user_rides do |t|
      t.belongs_to :user
      t.belongs_to :ride
      t.boolean :paid?
      t.boolean :accepted
      t.decimal :total_paid

      t.timestamps
    end
  end
end
