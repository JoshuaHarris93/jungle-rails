class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :rating
      t.references :product, foreign: true
      t.references :user, foreign: true
      t.timestamps null: false
    end
  end
end
