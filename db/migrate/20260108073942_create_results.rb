class CreateResults < ActiveRecord::Migration[7.2]
  def change
    create_table :results do |t|
      t.string :country, null: false

      t.timestamps
    end
  end
end
