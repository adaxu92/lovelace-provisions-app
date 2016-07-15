class AddDislikesToHoroscopes < ActiveRecord::Migration
  def change
    add_column :horoscopes, :dislikes, :integer
  end
end
