class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :customers, :is_deleted, true
  end
end
