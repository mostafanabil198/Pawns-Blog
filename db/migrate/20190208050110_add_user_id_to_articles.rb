class AddUserIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add column :articles, :user_id, :integer
  end
end
