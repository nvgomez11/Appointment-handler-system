class AppointmentsController < ApplicationController   
    after_action :verify_authorized, except: :index

    def index
        if current_user
            if current_user.role == 1                
                @cita_list = Appointment.all                 
                @employee = User.all                                
            else                            
                @cita_list = Appointment.where('user_id = ?',current_user.id)                        
                @employee = User.all
                
            end
        else

        end                                                
    end        

    def show
        @cita = Appointment.find(params[:id])
        authorize @cita
        @employee = User.all
    end
    
    def create        
        @cita = Appointment.new(appointment_params)                                              
        authorize @cita
        if( @cita.save)
            redirect_to appointment_path(id: @cita)  #Carga la vista show, con ese employee especifico
        else
            render 'new'
        end
    end

    def new
        @cita = Appointment.new()
        authorize @cita
    end

    def my_appointments
        @cita = Appointment.find_by_user_id(params[:id])
    end

    #este es el que carga despues de "see" en un appointment especifico
    def edit
        @cita = Appointment.find(params[:id])
        authorize @cita
    end

    #Se necesita este metodo extra para poder hacer update
    def update
        @cita = Appointment.find(params[:id]) 
        authorize @cita             
        if(@cita.update(appointment_params))
            redirect_to appointment_path(id: @cita)  #Carga la vista show, con ese employee especifico
        else
            render 'edit'
        end
    end

    def destroy 
        @cita = Appointment.find(params[:id])
        authorize @cita
        @cita.destroy
        
        redirect_to appointments_path
    end

    ##maneja los parametros que le entran al crear un nuevo employee
    private def appointment_params
        params.require(:appointment).permit(:user_id, :my_date)
    end

end
