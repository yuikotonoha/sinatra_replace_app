class Rename2TitreColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :commnet_image, :comment_image
  end
end
