class CreateBookmarks < ActiveRecord::Migration[7.2]
  def change
    create_table :bookmarks, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :bookmarkable, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
