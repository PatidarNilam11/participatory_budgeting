class CreatePhases < ActiveRecord::Migration[8.0]
  def change
    create_table :phases do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :active

      t.timestamps
    end
  end
end
