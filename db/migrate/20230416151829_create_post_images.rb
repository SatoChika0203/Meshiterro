class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      # idはマイグレーションファイルに記載がなくても必ず作成されるデフォルトの主キー
      t.string :shop_name
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end

# モデル名の途中に大文字が含まれていた場合、
# 単語の組み合わせと判断され、間に_（アンダースコア）が挿入される
