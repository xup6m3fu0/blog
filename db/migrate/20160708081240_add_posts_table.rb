class AddPostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :title
  		t.string :content

  		t.timestamp
  	end
  end
end
