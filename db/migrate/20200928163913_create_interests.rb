class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
      t.references :loved_one, null: false, foreign_key: true
      t.string :interest

      t.timestamps
    end
  end
end
