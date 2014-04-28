class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to :action => :index
    else  
      render :action => :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    redirect_to :action => :index
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy if @category.present?

    redirect_to :action => :index
  end

  def get_attrs
    @product = Product.find_by(id: params[:product_id])
    @category = @product.present? ? @product.category : Category.find(params[:category_id])

    @attrs = @category.product_attrs if @category.present?
  end
end
