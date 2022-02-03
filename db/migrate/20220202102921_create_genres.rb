class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name
      t.datetime :remember_created_at
      t.datetime :remember_updated_at

      t.timestamps
    end
  end
end
