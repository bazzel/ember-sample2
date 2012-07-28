class CreateTrackbacks < ActiveRecord::Migration
  def change
    create_table :trackbacks do |t|
      t.string :url
      t.references :post

      t.timestamps
    end
    add_index :trackbacks, :post_id
  end
end
