class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :member_id,null: false
      t.string :title,null: false
      t.string :customer,null: false
      t.text :caption,null: false
      t.string :region,null: false
      t.string :start_year,null: false
      t.string :start_month,null: false
      t.string :start_day,null: false
      t.string :end_year,null: false
      t.string :end_month,null: false
      t.string :end_day,null: false
      t.string :salesman,null: false
      t.integer :vehicle_type,null: false, default: 0
      t.integer :lease_type,null: false, default: 0
      t.string :body_shop,null: false
      t.string :body_number,null: false
      t.string :registration_number,null: false
      t.integer :insurance,null: false, default: 0

      t.timestamps
    end
  end
end
