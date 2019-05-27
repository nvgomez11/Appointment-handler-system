class PagesController < ApplicationController
    def index
        @content = "Esta es la pagina principal";
    end    

    def json
        appointments = Appointment.order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'Loaded appointments', data:appointments}, status: :ok
    end

    def show 
        @appointments_employee = Appointment.find_by_user_id(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded appointments for a specific employee', data:@appointments_employee}, status: :ok                
    end
end
