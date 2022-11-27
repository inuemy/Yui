class AddColumnCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :last_name, :string, null: false
    add_column :customers, :first_name, :string, null: false
    add_column :customers, :last_name_kana, :string, null: false
    add_column :customers, :first_name_kana,:string, null: false
    add_column :customers, :nickname, :string, null: false
    add_column :customers, :sex, :integer, null: false
    add_column :customers, :birthday, :date, null: false
    add_column :customers, :prefecture_id, :integer, null: false
    add_column :customers, :is_deleted, :boolean, null: false
  end
end
