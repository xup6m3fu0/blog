class AddCommentsTable < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.string :content
  		t.integer :user_id
  		t.integer :post_id

  		t.timestamp
  	end
  end
end
