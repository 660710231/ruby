class AddTitleToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :title, :string
  end
end
