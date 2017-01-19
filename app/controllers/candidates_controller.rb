class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:show, :edit, :update, :destroy]

  def index
    @candidates = Candidate.all
  end

  def show
  end

  def new
    @candidate = Candidate.new
  end

  def edit
  end

  def update
    if @candidate.update(candidate_params)
      redirect_to candidates_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path, notice: "新增成功"
    else
      render :new
    end
  end

  def destroy
    @candidate.destroy
    redirect_to candidates_path, notice: "刪除成功"
  end

  private
  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
    redirect_to candidates_path, notice: "查無資料" unless @candidate
  end

  def candidate_params
    params.require(:candidate).permit(:name, :age, :gender, :party)
  end
end
