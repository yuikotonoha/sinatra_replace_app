class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :commnet_text
      t.integer :post_id
      t.integer :user_id
      t.string :commnet_image
      t.string :score
      t.timestamps
    end
  end
end
