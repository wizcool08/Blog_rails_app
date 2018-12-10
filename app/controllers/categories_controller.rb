class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 3)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category was created successfully'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    # We using .try() as we don't know if current_user is nil value => current_user.nil? ? nil: current_user
    if !logged_in? || logged_in? and !current_user.try(:is_admin?)
      flash[:danger] = 'You are not logged in or authorized to create new Category'
      redirect_to root_path
    end
  end
end