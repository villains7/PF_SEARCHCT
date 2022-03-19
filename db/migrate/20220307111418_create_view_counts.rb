class CreateViewCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :view_counts do |t|
      t.integer :member_id
      t.integer :project_id

      t.timestamps
    end
  end
end
