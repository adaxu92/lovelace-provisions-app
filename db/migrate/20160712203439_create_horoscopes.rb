class CreateHoroscopes < ActiveRecord::Migration
  def change
  	add_column :horoscopes, :likes, :integer
  	add_column :horoscopes, :dislikes, :integer
    create_table :horoscopes do |t|
    	t.string :name
    	t.text :img
    	t.integer :likes
    	t.integer :dislikes
    end
  end
end
