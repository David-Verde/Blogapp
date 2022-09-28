class RenameUserIdInComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :author_id, :author_id
  end
end
