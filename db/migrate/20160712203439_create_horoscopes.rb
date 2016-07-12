class CreateHoroscopes < ActiveRecord::Migration
  def change
    create_table :horoscopes do |t|
    	t.string :name
    	t.text :img
    end
  end
end
