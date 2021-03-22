# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  let!(:list) { create(:list, title:'hoge', body:'body') }
  describe 'トップ画面（top_path）へのテスト' do
    before do
      visit top_path
    end
    context '表示の確認' do
      it 'トップ画面（top_path）に「ここはTopページです」が表示されているか' do
        expect(page).to have_content 'ここはTopページです'
      end
      it 'top_pathが"/top"であるか' do
        expect(current_page).to eq('/top')
      end
    end
  end

  describe '投稿画面のテスト' do
    before do
      visit tosolists_new_path
    end
    context '表示の確認' do
      it 'todolists_new_pathが"/todolists/new"であるか' do
        expect(current_page).to eq('/todolists/new')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '投稿'
      end
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'list[title]', with: Faker::Lorem.characters(number:5)
        fill_in 'list[body]', with: Faker::Lorem.characters(number:20)
        click_button '投稿'
        expect(page).to have_current_path todolist_path(List.last)
      end
    end
  end
  describe：一覧画面のテスト
    before：一覧画面への遷移
    context ：一覧の表示とリンクの確認
      it：一覧表示画面に投稿されたもの表示されているか
      テストコード

  describe：詳細画面のテスト
    before：詳細画面への遷移
    context：表示のテスト
      it：削除リンクが存在しているか
        テストコード
      it：編集リンクが存在しているか
    context：リンクの遷移先の確認
      it：編集の遷移先は編集画面か
        テストコード
    context：list削除のテスト
      it：listの削除
        テストコード

  describe：編集画面のテスト
    before：編集画面への遷移
    context：表示の確認
      it：編集前のタイトルと本文がフォームに表示(セット)されている
        テストコード
      it：保存ボタンが表示される
    context：更新処理に関するテスト
      it：更新後のリダイレクト先は正しいか
        テストコード
end