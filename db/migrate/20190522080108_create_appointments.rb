class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.timestamp :created_at
      t.timestamp :date

      t.timestamps
    end
  end
end
