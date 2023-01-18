class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|
      t.string :language
      t.string :category
      t.string :public_url

      t.timestamps
    end
  end
end
