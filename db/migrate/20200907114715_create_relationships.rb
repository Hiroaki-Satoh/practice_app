class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
	  t.integer :follower_id # フォローする人
	  t.integer :followed_id # フォローされる人
      t.timestamps
    end
  end
end
