class CreateValues < ActiveRecord::Migration[5.1]
  def change
    create_table :values do |t|
      t.string :currency
      t.datetime :time
      t.float :open
      t.float :high
      t.float :low
      t.float :close
      t.float :volumefrom
      t.float :volumeto

      t.timestamps
    end
  end
end
