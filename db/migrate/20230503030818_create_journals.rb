class CreateJournals < ActiveRecord::Migration[7.0]
  def change
    create_table :journals do |t|
      t.datetime :date
      t.string :entry

      t.timestamps
    end
  end
end
