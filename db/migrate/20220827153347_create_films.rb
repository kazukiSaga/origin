class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.integer :user_id
      t.string :title
      t.text :story
      t.string :filmdirector
      t.string :origin
      t.date :releasedate
      t.string :country
      t.string :starring

      t.timestamps
    end
  end
end
