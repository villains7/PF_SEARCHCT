class Batch::DataReset
  def self.data_reset
    # 閲覧数を1ヶ月でリセットする
    ViewCount.delete_all
    p "閲覧数をリセットしました。"
  end
end