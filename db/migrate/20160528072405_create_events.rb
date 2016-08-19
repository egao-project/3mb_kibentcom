class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
    	t.integer :company_id
    	t.string :title
      t.string :desc_title
    	t.string :desc
    	t.datetime :start
    	t.datetime :end
    	t.integer :max
      t.string :img_path
      t.timestamps
    end
    create_table :entrants do |t|
    	t.integer :event_id
    	t.integer :company_id
      	t.timestamps
    end 
    create_table :users do |t|
    	t.string :name
      	t.timestamps
    end 
    create_table :companies do |t|
    	t.string :name
    	t.string :addr
      t.string :desc
      	t.timestamps
    end 
  end
end
