class TodolistsController < ApplicationController
  def new
    #データが単数のため[@list]となっている
    @list=List.new
  end

  def create
    #データを新規登録するためのインスタンス。viewを介さないため@なし
    list = List.new(list_params)
    #データをデータベースへ保存するためのsaveメソッド
    list.save
    #show.html.erbへリダイレクトさせて、投稿内容をすぐ閲覧できるようにする
    redirect_to todolist_path(list.id)
  end

  def index
    #すべてのデータを取り込むため複数形[@lists]となっている
    @lists = List.all
  end

  def show
    #findメソッドを利用してデータベースから:idのデータを取得
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  private
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
