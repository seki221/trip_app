class CreateReschedules < ActiveRecord::Migration[7.0]
  def change
    create_table :reschedules, id: :uuid do |t|
      t.uuid :original_schedule_id, null: false
      t.references :planner, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    # 外部キー制約を明示的に貼る（schedules.id は uuid なので型を合わせる）
    add_foreign_key :reschedules, :schedules, column: :original_schedule_id
  end
end
