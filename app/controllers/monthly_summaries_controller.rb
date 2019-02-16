class MonthlySummariesController < ApplicationController
  before_action :set_monthly_summary, only: [:show, :edit, :update, :destroy]

  # GET /monthly_summaries
  # GET /monthly_summaries.json
  def index
    @monthly_summaries = MonthlySummary.all.order(:begin_at)
  end

  # GET /monthly_summaries/1
  # GET /monthly_summaries/1.json
  def show
  end

  # GET /monthly_summaries/new
  def new
    @monthly_summary = MonthlySummary.new
  end

  # GET /monthly_summaries/1/edit
  def edit
  end

  # POST /monthly_summaries
  # POST /monthly_summaries.json
  def create
    @monthly_summary = MonthlySummary.new(monthly_summary_params)

    respond_to do |format|
      if @monthly_summary.save
        format.html { redirect_to @monthly_summary, notice: 'Monthly summary was successfully created.' }
        format.json { render :show, status: :created, location: @monthly_summary }
      else
        format.html { render :new }
        format.json { render json: @monthly_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_summaries/1
  # PATCH/PUT /monthly_summaries/1.json
  def update
    respond_to do |format|
      if @monthly_summary.update(monthly_summary_params)
        format.html { redirect_to @monthly_summary, notice: 'Monthly summary was successfully updated.' }
        format.json { render :show, status: :ok, location: @monthly_summary }
      else
        format.html { render :edit }
        format.json { render json: @monthly_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_summaries/1
  # DELETE /monthly_summaries/1.json
  def destroy
    @monthly_summary.destroy
    respond_to do |format|
      format.html { redirect_to monthly_summaries_url, notice: 'Monthly summary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_summary
      @monthly_summary = MonthlySummary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monthly_summary_params
      params.require(:monthly_summary).permit(:year, :month, :begin_at, :end_at, :carryover_amount, :this_month_amount, :amount, :customer_id)
    end
end
