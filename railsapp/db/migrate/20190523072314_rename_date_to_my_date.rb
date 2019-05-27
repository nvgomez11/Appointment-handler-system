class RenameDateToMyDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :appointments, :date, :my_date  
  end
end
