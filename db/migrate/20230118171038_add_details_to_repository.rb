class AddDetailsToRepository < ActiveRecord::Migration[6.1]
  def change
    add_column :repositories, :title, :string
    add_column :repositories, :stargazerCount, :integer
    add_column :repositories, :forkCount, :integer
    add_column :repositories, :lastUpdatedAt, :date
  end
end
