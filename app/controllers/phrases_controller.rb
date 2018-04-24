class PhrasesController < ApplicationController
  before_action :set_phrase, only: [:show, :edit]

  def index
    head 501
    @phrases = Phrase.all
  end

  def show
  end

  def new
    @phrase = Phrase.new
  end

  def edit
  end

  def create
    @phrase = Phrase.new(phrase_params)

    respond_to do |format|
      if @phrase.save || find_phrase
        format.html { redirect_to find_phrase, notice: 'Phrase was successfully created.' }
        format.json { render :show, status: :created, location: find_phrase }
      elsif 
        format.html { render :new }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    create
  end

  def destroy
    head 501
  end

  private
    def set_phrase
      @phrase = Phrase.find_by(hashid: params[:id])
    end

    def phrase_params
      params.require(:phrase).permit(:content)
    end

    def find_phrase
      Phrase.find_by(digest: @phrase.digest)
    end
end
