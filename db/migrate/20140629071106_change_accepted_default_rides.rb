class ChangeAcceptedDefaultRides < ActiveRecord::Migration
  def change
    change_column :user_rides, :accepted, :boolean, :default => false
    change_column :user_rides, :paid?, :boolean, :default => false
    change_column :user_rides, :total_paid, :decimal, :default => 0
  end
end
