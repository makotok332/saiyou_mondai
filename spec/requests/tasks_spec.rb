require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    subject {get(tasks_path)}
    before{create_list(:task, 3)}
    fit "タスクの一覧が取得できる" do
      subject
      res = JSON.parse(response.body)
      expect(res.length).to eq 3
      expect(res[0].keys).to eq ["id", "title", "description", "due_date", "completed", "created_at", "updated_at"]
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /tasks/:id" do
    subject {get(task_path(task_id))}
    context "指定しタスクが存在する場合" do
      let(:task_id){task.id}
      let(:task){create(:task)}
      it "そのタスクが取得できる" do
        subject
        res = JSON.parse(response.body)
        expect(res["title"]).to eq task.title
        expect(res["description"]).to eq task.description
        expect(response).to have_http_status(200)
      end
    end
    context "指定しタスクが存在しない場合"do
      let(:task_id){1000000}
      it "タスクが見つからない" do
        expect{subject}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

  end

  describe "POST /tasks" do
    subject{post(tasks_path, params: params)}
    context "適切なパラメーター送信したとき" do
      let(:params){{task: attributes_for(:task)}}
      it "タスクを作成できる"do
        expect{subject}.to change{Task.count}.by(1)
        res = JSON.parse(response.body)
        expect(res["title"]).to eq params[:task][:title]
        expect(res["description"]).to eq params[:task][:description]
        expect(response).to have_http_status(201)
      end
    end
    context "不適切なパラメーター送信したとき"do
      let(:params){attributes_for(:task)}
      it "エラーする" do
      expect{subject}.to raise_error(ActionController::ParameterMissing)
      end
    end
  end

  describe "PATCH(PUT) /tasks/:id" do
    subject{patch(task_path(task_id), params: params)}
    let(:params){
      {task: {title: Faker::Book.title, created_at: 1.day.ago}}
    }
    let(:task_id){task.id}
    let(:task){create(:task)}
    it "任意のタスクを更新できる"do
      expect{subject}.to change {Task.find(task_id).title}.from(task.title).to(params[:task][:title])
      expect{subject}.not_to change {Task.find(task_id).created_at}
      expect{subject}.not_to change {Task.find(task_id).description}
    end
  end

  describe "DELETE /tasks/:id" do
    subject{delete(task_path(task_id))}
    let(:task_id){task.id}
    let!(:task){create(:task)}
    it "任意のタスクが削除できる" do
      expect { subject }.to change { Task.count }.by(-1)
    end
  end
end
