class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    # 寫入資料...
    flash[:notice] = "新增成功"
    redirect_to candidates_path
  end

end
