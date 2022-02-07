class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :number_of_likes, default: 0
      t.integer :number_of_hates, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
