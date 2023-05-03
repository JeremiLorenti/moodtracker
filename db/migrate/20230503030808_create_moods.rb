class CreateMoods < ActiveRecord::Migration[7.0]
  def change
    create_table :moods do |t|
      t.datetime :date
      t.string :mood
      t.string :notes

      t.timestamps
    end
  end
end
