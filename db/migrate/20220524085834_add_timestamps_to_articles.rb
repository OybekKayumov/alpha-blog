class AddTimestampsToArticles < ActiveRecord::Migration[7.0]
  def change
    
  end
end

# add column method: add_column
# 1st argument is name of table :articles
# 2nd argument is attribute name :created_at 
# 3d argument is datatype :datetime 

# and run rails bd:migrate


# add_column :articles, :created_at, :datetime
# add_column :articles, :updated_at, :datetime