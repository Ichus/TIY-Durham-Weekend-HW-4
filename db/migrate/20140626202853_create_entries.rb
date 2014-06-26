class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :description
      t.datetime :post_date
      t.references :user, index: true

      t.timestamps
    end
  end
end
