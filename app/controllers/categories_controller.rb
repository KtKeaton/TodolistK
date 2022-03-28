class CategoriesController < ApplicationController
  def index
    @tags = Category.where("name like ?", "%\#{params[:q]}%").select("tag")
    render json: { tags: @tags.map { |t| { id: t.id, text: t.name } } }
  end
end
