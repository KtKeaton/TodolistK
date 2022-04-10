class Api::V1::TasksController < ApplicationController
    def favorite
    task = Task.find(params[:id])

    if Bookmark.exists?(task: task)
      # 移除最愛
      current_user.favorite_notes.delete(task)
      render json: { status: "removed", id: params[:id] }
    else
      # 新增最愛
      current_user.favorite_notes << task
      render json: { status: "added", id: params[:id] }
    end
  end
end
