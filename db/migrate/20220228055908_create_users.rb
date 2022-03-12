class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.date :date_of_birth
      t.string :email
      t.string :phone
      t.references :establishment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
