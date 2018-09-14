class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :content
      t.integer :word_id, foreign_key: true
      t.boolean :correct, foreign_key: true, default: false

      t.timestamps
    end
  end
end
