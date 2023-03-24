require 'rails_helper'

RSpec.describe Task, type: :model do
  context "title が記入されているとき" do
    it "Task が作成される" do
      task = build(:task)
      expect(task.valid?).to eq true
    end
  end

  context "title が記入されていないとき" do
    it "Task の作成に失敗する" do
      task = build(:task, title: nil)
      expect(task.valid?).to eq false
    end
  end
end
