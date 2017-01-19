class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
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
end
