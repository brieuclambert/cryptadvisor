class AddEmaToValue < ActiveRecord::Migration[5.1]
  def change
    add_column :values, :ema_7, :float
    add_column :values, :ema_15, :float
    add_column :values, :ema_30, :float
    add_column :values, :ema_50, :float
  end
end
