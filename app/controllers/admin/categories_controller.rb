class Admin::CategoriesController < Admin::BaseController
  
  def index
    @categories = Category.all
    
    if params[:id]
      @category = Category.find(params[:id])
    else
      @category = Category.new
    end
  end
  
  # 這裡我們只使用index 這個 template，所以統一 render or redirect 到 index
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "category was successfully created"
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notice] = "category was successfully updated"
    else
      @categories = Category.all
      render :index
    end
  end
  
  def destroy
    category = Category.find(params[:id])
    category.destroy
    if category.destroy
      flash[:alert] = "category was successfully deleted"
    else
      flash[:alert] = category.errors.messages[:base][0]
    end
    redirect_to admin_categories_path
  end
  
  private

  def category_params
    params.require(:category).permit(:name)
  end

end
