class ProductsController < ApplicationController
  # เรียกใช้ set_product อัตโนมัติเฉพาะ 4 actions นี้
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/:id
  def show
    # @product ถูกดึงมาจาก set_product เรียบร้อยแล้ว
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/:id/edit
  def edit
    # @product ถูกดึงมาจาก set_product
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/:id
  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/:id (Bonus)
  def destroy
    @product.destroy
    redirect_to products_path, notice: "Product was successfully deleted."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :price, :description) # ปรับตามฟิลด์จริงใน Model
  end
end