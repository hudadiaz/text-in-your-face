class SayingsController < ApplicationController
  before_action :set_saying, only: [:show, :edit, :update]

  def index
    head 501
  end

  def show
    set_meta_tags title: @saying.content,
                  description: @saying.content
  end

  def new
    @saying = Saying.new
    @saying.build_style
    set_meta_tags title: 'Shout in text!',
                  description: 'Display large text on your screen'
  end

  def edit
  end

  def create
    @saying = Saying.new(saying_params)

    respond_to do |format|
      if @saying.save
        format.html { redirect_to @saying }
        format.json { render :show, status: :created, location: @saying }
      elsif 
        format.html { render :new }
        format.json { render json: @saying.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @saying.update(saying_params)
        format.html { redirect_to @saying }
        format.json { render :show, status: :created, location: @saying }
      elsif 
        format.html { render :new }
        format.json { render json: @saying.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    head 501
  end

  private
    def set_saying
      @saying = Saying.find_by(hashid: params[:id])
    end

    def saying_params
      params.require(:saying).permit(:thing_content, style_attributes: [:id, :theme, :font, :css])
    end
end
