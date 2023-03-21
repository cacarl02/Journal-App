class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :task
      t.integer :quadrant
      t.integer :category_id

      t.timestamps
    end
  end
end
