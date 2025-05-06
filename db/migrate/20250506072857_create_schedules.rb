class CreateSchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :schedules, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :planner, null: false, foreign_key: true, type: :uuid
      t.string :destination
      t.datetime :start_date
      t.datetime :end_date
      t.date :date
      t.integer :cost
      t.text :description
      # 並び替え機能用
      t.integer :position
      # 画像用
      t.string :image
      # 位置情報
      t.text :address
      t.float :latitude
      t.float :longitude

      t.timestamps
  end  end
end
