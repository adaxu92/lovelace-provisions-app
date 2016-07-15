class AddLikesToHoroscopes < ActiveRecord::Migration
  def change
    add_column :horoscopes, :likes, :integer
  end
end
