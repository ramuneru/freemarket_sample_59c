class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      # UserテーブルのId
      t.integer  :user_id, null: false

      # Payjpの顧客Id
      t.string   :customer_id, null: false

      # payjpのデフォルトカードId
      t.string   :card_id, null: false
      t.timestamps
    end
  end
end
