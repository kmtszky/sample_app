class TodolistsController < ApplicationController
  def new
    @list=List.new
  end

  def create
    #データを新規登録するためのインスタンス
    list = List.new(list_params)
    #データをデータベースへ保存するためのsaveメソッド
    list.save
    #top画面へリダイレクト
    redirect_to '/top'
  end

  private
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
