class RenameTitreColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :commnet_text, :comment_text
  end
end
