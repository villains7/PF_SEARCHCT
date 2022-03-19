class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :member_id,null: false
      t.string :title,null: false, default: ""
      t.string :customer,null: false, default: ""
      t.text :caption,null: false, default: ""
      t.string :region,null: false, default: ""
      t.string :start_year,null: false, default: ""
      t.string :start_month,null: false, default: ""
      t.string :start_day,null: false, default: ""
      t.string :end_year,null: false, default: ""
      t.string :end_month,null: false, default: ""
      t.string :end_day,null: false, default: ""
      t.string :salesman,null: false, default: ""
      t.integer :vehicle_type,null: false, default: 0
      t.integer :lease_type,null: false, default: 0
      t.string :body_shop,null: false, default: ""
      t.string :body_number,null: false, default: ""
      t.string :registration_number,null: false, default: ""
      t.integer :insurance,null: false, default: 0

      t.timestamps
    end
  end
end
