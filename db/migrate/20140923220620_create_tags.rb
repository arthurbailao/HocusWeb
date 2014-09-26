class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :uid
      t.string :rid
      t.string :technology
      t.string :tag_type
      t.string :manufacturer
      t.belongs_to :product

      t.timestamps
    end

    add_index :tags, [:uid, :rid], unique: true
  end
end
