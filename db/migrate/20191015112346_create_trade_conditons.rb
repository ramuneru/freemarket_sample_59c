class CreateTradeConditons < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_conditons do |t|
      t.integer :status, null: false
      t.timestamps
    end
  end
end
