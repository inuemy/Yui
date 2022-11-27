class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :customer_id, null: false
      t.integer :prefectures_id, null: false
      t.string :venue, null: false
      t.text :chapel
      t.text :reception
      t.text :food
      t.text :staff
      t.text :access
      t.text :comment

      t.timestamps
    end
  end
end