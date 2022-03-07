class  Public::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @records = Project.search_for(@content)
    project_before = Project.where('created_at: <= ?', Time.now)
    project_before.where(params[:create_at].all_month)
    #Project.where(create_at:選択した月 1..31)

    # where 範囲を指定する方法
    # 1つ点からその月の範囲に変換する方法

  end
end
