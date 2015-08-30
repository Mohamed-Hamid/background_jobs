class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :title
      t.integer :count

      t.timestamps
    end
  end
end
