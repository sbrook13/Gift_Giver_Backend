class CreatePresentIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :present_ideas do |t|
      t.references :loved_one, null: false, foreign_key: true
      t.string :title, null: false
      t.string :url
      t.text :description
      t.string :status, null: false

      t.timestamps
    end
  end
end
