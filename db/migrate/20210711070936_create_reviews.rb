class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :user
      t.integer :stars
      t.text :review
      t.references :series

      t.timestamps
    end
  end
end
