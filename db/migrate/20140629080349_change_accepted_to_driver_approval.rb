class ChangeAcceptedToDriverApproval < ActiveRecord::Migration
  def change
    rename_column :user_rides, :accepted, :driver_approval
    add_column :user_rides, :rider_approval, :boolean, :default => false
  end
end
