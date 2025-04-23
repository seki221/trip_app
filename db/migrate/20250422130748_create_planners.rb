class CreatePlanners < ActiveRecord::Migration[7.2]
  def change
    create_table :planners, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :title
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
