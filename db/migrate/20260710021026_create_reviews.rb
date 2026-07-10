class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.string :reviewer_name
      t.integer :rating
      t.text :comment
      t.integer :playfulness
      t.integer :affection
      t.integer :ease_of_care
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
