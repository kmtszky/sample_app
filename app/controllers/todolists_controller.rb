class TodolistsController < ApplicationController
  def new
    #データが単数のため[@list]となっている
    @list=List.new
  end

  def create
    #データを新規登録するためのインスタンス。viewを介さないため@
    list = List.new(list_params)
    #データをデータベースへ保存するためのsaveメソッド
    list.save
    #top画面へリダイレクト
    redirect_to '/top'
  end
  
  def index
    #すべてのデータを取り込むため複数形[@lists]となっている
    @lists=List.all
  end

  private
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
