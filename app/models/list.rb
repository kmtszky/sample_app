class List < ApplicationRecord
end

# Refileを使うため、attachmentメソッドをモデルに追加。カラム名はimgae_idだが、ここではidを付けない
class List < ApplicationRecord
  attachment:image
end