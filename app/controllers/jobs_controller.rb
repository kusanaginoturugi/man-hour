# coding: utf-8
class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :selected_customer, only: [:index, :report, :new, :search]

  # GET  /jobs/search/
  # POST /jobs/search/
  def search
    if params[:job].present?
      @job = Job.new(job_params)
    else
      @job = Job.new
    end
    @jobs = Job.where(customer_id: @customer_id)
    if @job.title.present? && @job.detail.present?
      @jobs = @jobs.where("title LIKE ?",  "%#{@job.title}%").or("detail LIKE ?", "%#{@job.detail}%")
    elsif @job.title.present?
      @jobs = @jobs.where("title LIKE ?",  "%#{@job.title}%")
    elsif @job.detail.present?
      @jobs = @jobs.where("detail LIKE ?", "%#{@job.detail}%")
    end
    puts @jobs.to_sql
  end

  # GET /jobs
  def index
    tgt_date = Time.now
    if session['tgt_date'].present?
      tgt_date = DateTime.parse(session['tgt_date'])
    end
    if params[:month].present?
      if params[:month] == 'prev'
        tgt_date = tgt_date.prev_month
      elsif params[:month] == 'next'
        tgt_date = tgt_date.next_month
      end
    end
    session['tgt_date'] = tgt_date
    date_from = tgt_date.beginning_of_month
    date_to = tgt_date.end_of_month
    @jobs = Job.where(customer_id: @customer_id, begin_date: (date_from)..(date_to))
    # if param.blank?
    #   last_page = @jobs.num_pages
    #   @jobs = Job.page(last_page)
    # end
  end

  # GET /jobs/report
  # GET /jobs/report.pdf
  def report
    @date = DateTime.parse(params[:begin_date])
    @jobs = Job.monthly(@customer_id, @date)
    @job_summery = Job.summery(@customer_id, @date)
    @monthly_summary = MonthlySummary.where(customer_id: @customer_id, year: @date.year, month: @date.month).first
    respond_to do |format|
      format.html
      format.pdf do
         render pdf:    'jobs_pdf',
             layout:    'printer.html',
             template:  'jobs/report_pdf.html.slim',
             page_size: 'A4',
             orientation: 'Landscape',
             margin:  { top: 15, bottom: 15, left: 10, right: 10 },
             header:  { font_size: 10,
                             line: true,
                             left: "冬水社 作業報告書 「#{@date.year}年#{@date.month}月」" },
             footer:  { font_size: 10,
                             line: true,
                           center: '[page] of [topage]' }
      end
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @job.customer_id = @customer_id
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:job_type_id, :title, :detail, :outside_budget, :cost, :place, :begin_date, :end_date, :work_minutes, :customer_id)
    end

    def selected_customer
      if session['selected_customer'].present?
        @customer_id = session['selected_customer']
      else
        @customer_id = Customer.first.id
      end
    end

end
