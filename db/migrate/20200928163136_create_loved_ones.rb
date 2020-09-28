class CreateLovedOnes < ActiveRecord::Migration[6.0]
  def change
    create_table :loved_ones do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.date :birthday, null: false
      t.integer :age
      t.string :gender
      t.string :image_url
      t.string :relationship, null: false
      t.string :mailing_address1
      t.string :mailing_address2
      t.string :mailing_city
      t.string :mailing_state
      t.string :mailing_zip

      t.timestamps
    end
  end
end
