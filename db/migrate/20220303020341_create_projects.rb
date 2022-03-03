class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :member_id,null: false, default: ""
      t.string :title,null: false, default: ""
      t.text :caption,null: false, default: ""
      t.string :region,null: false, default: ""
      t.string :year,null: false, default: ""
      t.string :salesman,null: false, default: ""
      t.string :project_image_url

      t.timestamps
    end
  end
end
