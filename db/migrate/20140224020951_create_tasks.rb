class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.references :list, index: true

      t.timestamps
    end
  end
end
