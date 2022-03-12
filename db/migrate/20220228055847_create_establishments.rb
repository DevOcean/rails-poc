class CreateEstablishments < ActiveRecord::Migration[6.0]
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :registration_number

      t.timestamps
    end
  end
end
