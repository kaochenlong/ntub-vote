class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
  end

  def show
    @candidate = Candidate.find_by(id: params[:id])
    redirect_to candidates_path, notice: "查無資料" unless @candidate
  end

  def new
    @candidate = Candidate.new
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
    redirect_to candidates_path, notice: "查無資料" unless @candidate
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])
    redirect_to candidates_path, notice: "查無資料" unless @candidate
    clean_params = params.require(:candidate).permit(:name, :age, :gender, :party)

    if @candidate.update(clean_params)
      redirect_to candidates_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def create
    # 寫入資料...
    clean_params = params.require(:candidate).permit(:name, :age, :gender, :party)

    @candidate = Candidate.new(clean_params)

    if @candidate.save
      redirect_to candidates_path, notice: "新增成功"
    else
      render :new
    end
  end

  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    redirect_to candidates_path, notice: "查無資料" unless @candidate

    @candidate.destroy
    redirect_to candidates_path, notice: "刪除成功"
  end
end
