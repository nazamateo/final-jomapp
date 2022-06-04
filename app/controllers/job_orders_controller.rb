class JobOrdersController < ApplicationController
  before_action :set_job_order, only: %i[ show edit update destroy ]

    def index
        @job_orders = JobOrder.all
    end
    
    def show
    end
        
    def new
        @job_order = JobOrder.new
        @date_today = date_today("%a, %d %b %Y")
    end

    def create
        @job_order = JobOrder.new job_order_params 
        
        respond_to do |format|
            if @job_order.save
                format.html { redirect_to job_order_url(@job_order), notice: "Job Order was successfully created." }
                format.json { render :show, status: :created, location: @job_order }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @job_order.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def edit
        @date_today = date_today("%a, %d %b %Y")
    end
    
    def update
         respond_to do |format|
            if @job_orders.update(job_order_params_edit)
                format.html { redirect_to job_order_url(@job_orders[0].job_order_number), notice: "Job Order was successfully updated." }
                format.json { render :show, status: :ok, location: @job_orders[0].job_order_number }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @job_orders[0].job_order_number.errors, status: :unprocessable_entity }
            end
        end
    end
    

    def destroy
        @job_orders[0].destroy
        respond_to do |format|
            format.html { redirect_to job_orders_url, notice: "Job Order was successfully destroyed." }
            format.json { head :no_content }
        end
    end
    
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_order
        @job_orders = JobOrder.where "job_order_number = ?", params[:id]
    end

    # Only allow a list of trusted parameters through.
    def job_order_params
      params.require(:job_order).permit(:service, :department, :description)
    end

    def job_order_params_edit
      params.require(:job_order).permit(:classification, :engineering_unit, :status, :remarks)
    end

    def date_today(str)
        Date.today.strftime(str)
    end




    # def show_service
    #     @job_orders = JobOrder.where "service = ?", params[:service]
    # end

    # def show_department
    #     @job_orders = JobOrder.where "department = ?", params[:department]
    # end
    
    # def show_created_at_month
    #     @job_orders = JobOrder.where "created_at_month = ?", params[:created_at_month]
    # end
    
    # def show_created_at_year
    #     @job_orders = JobOrder.where "created_at_year = ?", params[:created_at_year]
    # end

    # def show_created_at_month_year_service
    #     @job_orders = JobOrder.where "created_at_month = ? AND created_at_year = ? AND service = ?",  params[:created_at_month], params[:created_at_year], params[:service]
    # end
    
    # def show_created_at_year_service
    #     @job_orders = JobOrder.where "created_at_year = ? AND service = ?", params[:created_at_year], params[:service]
    # end
end
