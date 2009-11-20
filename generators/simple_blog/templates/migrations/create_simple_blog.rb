class CreateSimpleBlog < ActiveRecord::Migration
  def self.up
    create_table  :posts do |t|
      t.string :subject
      t.text :body
      t.boolean :disable_comments
      t.timestamps
    end

    create_table :comments do |t|
      t.references :post
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
    drop_table :comments
  end
end