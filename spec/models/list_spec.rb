describe 'モデルのテスト' do
  it "有効な投稿内容の場合は保存されるか" do
    expectation(FactoryBot.build(:list)).to be_valid
  end
end