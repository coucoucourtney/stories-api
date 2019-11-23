class Api::V1::StoriesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [ :update, :create, :destroy ]
  before_action :set_story, only: [ :show, :update, :destroy ]

  def index
    @stories = Story.all.sort.reverse
  end

  def show
  end

  def update
    if @story.update(story_params)
      render :show
    else
      render_error
    end
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @story.destroy
    head :no_content
    # can say head :ok so that dont get errors from the response since its supposed to be empty (a built in ruby thing)
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def render_error
    render json: { errors: @story.errors.full_messages },
      status: :unprocessable_entity
  end
end
