class HomeController < ApplicationController

  def index
    if params[:name].present?
      res_body = Github::Searh.new(name: params[:name], options: { page: params[:page]} ).call
      @items = res_body['items'] if res_body['items'].present?
      @paginatable_array = Kaminari.paginate_array([], total_count: res_body['total_count']).page(params[:page])
    end
  end

end
