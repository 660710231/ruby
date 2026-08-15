class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :complete
      t.validates :title
      t.timestamps
    end
  end
end
