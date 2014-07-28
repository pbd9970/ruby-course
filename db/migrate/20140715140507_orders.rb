class Orders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user

      t.timestamp
    end
  end
end
