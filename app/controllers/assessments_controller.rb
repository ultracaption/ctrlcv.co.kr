class AssessmentsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index]
  before_filter :find_lecture
  before_filter :set_active_menu_to_assessments_mine, only: :mine

  def new
    @assessment = Assessment.new
  end

  def index
    if @lecture
      @assessments = @lecture.assessments
      @assessment = current_user.assessment_for(@lecture)
      render 'lectures/show'
    else
      @assessments = Assessment.paginate(page: params[:page] || 1)
    end
  end

  def create
    @assessment = Assessment.new params[:assessment]
    @assessment.lecture = @lecture
    @assessment.user = current_user

    unless @assessment.save
      flash[:alert] = @assessment.errors.full_messages.first
    end

    @assessments = @lecture.assessments
    render 'lectures/show'
  end

  def update
    @assessment = Assessment.find params[:id]

    unless @assessment.update_attributes params[:assessment]
      flash[:alert] = @assessment.errors.full_messages.first
    end

    @assessments = @lecture.assessments

    render 'lectures/show'
  end

  def mine
    @assessments = current_user.assessments.paginate(page: params[:page] || 1)
    render :index
  end

  private
    def find_lecture
      if params[:lecture_id]
        @lecture = Lecture.find params[:lecture_id]
      end
    end
end
