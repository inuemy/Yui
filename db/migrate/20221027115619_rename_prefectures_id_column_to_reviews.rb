class RenamePrefecturesIdColumnToReviews < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :prefectures_id, :prefecture_id
  end
end
