class AddAuthorId < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :author_id, :bigint, null: false
  end
end
