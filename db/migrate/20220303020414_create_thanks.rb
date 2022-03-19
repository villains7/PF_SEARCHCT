class CreateThanks < ActiveRecord::Migration[6.1]
  def change
    create_table :thanks do |t|
      t.integer :member_id,null: false
      t.integer :project_id,null: false
      t.timestamps
    end
  end
end
