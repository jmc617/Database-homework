class CreateHmwkTables < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |u|
      u.string :name
    end
    create_table :articles do |a|
      a.string :title
      a.string :author
    end
    create_table :comments do |c|
      c.string :content
      c.string :author
    end
  end
end
