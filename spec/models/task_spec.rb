require 'rails_helper'

RSpec.describe Task, type: :model do
  context "title が記入されているとき" do
    it "Task が作成される" do
      task = Task.new(
        "title": "xxx",
        "description": "xxx",
        "due_date": "2023/03/23",
        "completed": 0)
      expect(task.valid?).to eq true
    end
  end

  context "title が記入されていないとき" do
    it "Task の作成に失敗する" do
      task = Task.new(
        "title": nil,
        "description": "xxx",
        "due_date": "2023/03/23",
        "completed": 0)
      expect(task.valid?).to eq false
    end
  end
end
