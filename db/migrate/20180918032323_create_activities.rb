class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.references :action, polymorphic: true

      t.timestamps
    end
  end
end
