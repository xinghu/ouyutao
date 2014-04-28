class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to :action => :index
    else  
      render :action => :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(params[:product])
    redirect_to :action => :index
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy if @product.present?

    redirect_to :action => :index
  end
end
