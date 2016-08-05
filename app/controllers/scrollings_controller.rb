class ScrollingsController < ApplicationController
  def index
  	@users = User.all.per_page_kaminari(params[:page]).per Settings.per_page

	respond_to do |format|
	  format.html
	  format.js
	end
  end
end