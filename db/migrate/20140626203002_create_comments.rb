class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.datetime :post_date
      t.references :entry, index: true

      t.timestamps
    end
  end
end
