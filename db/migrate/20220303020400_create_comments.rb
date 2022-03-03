class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :member_id,null: false, default: ""
      t.integer :project_id,null: false, default: ""
      t.text :comment,null: false, default: ""

      t.timestamps
    end
  end
end