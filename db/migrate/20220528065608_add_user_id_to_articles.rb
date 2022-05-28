class AddUserIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :user_id, :int
  end
end

# add_column is method
# :article is argument and name of table
# :user_id column which we want to add 
# :int is type of :user_id column

# run this migration file
# rails db:migrate