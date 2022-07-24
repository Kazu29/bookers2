class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      
      ##ユーザーを識別するID
      t.integer :User_id
      
      ##本のタイトル
      t.string :title

      ##感想
      t.text :body

      t.timestamps
    end
  end
end
