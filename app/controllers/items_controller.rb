class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
    before_action :set_prototype, only: [:edit, :show]
    before_action :move_to_index, only: [:edit]
  
    def index
      #  @items = Item.includes(:user)
    end
    def new
      @item = Item.new
    end
  
    def edit
    end
    
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def show
      @comment = Comment.new
      @comments = @item.comments.includes(:user)
    end
  
    def destroy
      item = Item.find(params[:id])
      item.destroy
      redirect_to root_path
    end
  
    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to item_path(@item)
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    private
    def item_params
      params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    end
  
    def set_prototype
      @item = Item.find(params[:id])
    end
  
    def move_to_index
      if current_user != @Item.user
        redirect_to root_path
      end
    end
    
  end