class CreateBranches < ActiveRecord::Migration[7.2]
  def change
    create_table :branches do |t|
      t.integer :answer, null: false
      t.references :question, null: false, foreign_key: true
      t.references :next_question, foreign_key: { to_table: :questions }
      t.references :result, foreign_key: true

      t.timestamps
    end
  end
end
