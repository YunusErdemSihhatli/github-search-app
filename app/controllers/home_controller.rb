class HomeController < ApplicationController

  def index
    if params[:name].present?
      res_body = Github::Searh.new(name: params[:name]).call
    end
  end

end
