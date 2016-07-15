class CreateHoroscopes < ActiveRecord::Migration
  def change
    create_table :horoscopes do |t|
    	t.string :name
    	t.text :img
    	t.integer :likes, :default => 0
    	t.integer :dislikes, :default => 0
    end
  end
end
