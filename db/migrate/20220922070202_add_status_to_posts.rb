class AddStatusToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :status, :integer, :default => 1
    #Ex:- :default =>''
  end
end
