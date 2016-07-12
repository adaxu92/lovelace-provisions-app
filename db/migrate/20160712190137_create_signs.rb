class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
    	t.string :name
    	t.text :img_url
    end
  end
end
