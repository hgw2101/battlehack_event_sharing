class ChangePaidQuestionMarkToPaid < ActiveRecord::Migration
  def change
    rename_column :user_rides, :paid?, :paid
  end
end
