class TodolistsController < ApplicationController
  def new
    @list = List.new  #データが単数のため[@list]
  end

  def create
    list = List.new(list_params)        #データを新規登録するためのインスタンス。viewを介さないため@なし
    list.save                           #データをデータベースへ保存するためのsaveメソッド
    redirect_to todolist_path(list.id)  #show.html.erb（投稿一覧）へリダイレクトさせて、投稿内容をすぐ閲覧できるようにする
  end

  def index
    @lists = List.all #すべてのデータを取り込むため複数形[@lists]となっている
  end

  def show
    @list = List.find(params[:id]) #findメソッドを利用してデータベースから:idのデータを取得

  end

  def edit
    @list = List.find(params[:id]) #findメソッドを利用してデータベースから:idのデータを取得
  end

  def update
    list = List.find(params[:id])       #findメソッドを利用してデータベースから:idのデータを取得
    list.update(list_params)            #データを更新
    redirect_to todolist_path(list.id)  #show.html.erbへリダイレクトさせて、すぐ確認できるようにする
  end

  def destroy
    @list = List.find(params[:id])      #findメソッドを利用してデータベースから:idのデータを取得
    list.destroy                        #データ（レコード）削除
    redirect_to todolists_path(list.id)  #index.html.erb（投稿一覧）へリダイレクトさせて、すぐ確認できるようにする
  end

  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
