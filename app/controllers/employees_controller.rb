class EmployeesController < ApplicationController
    def index
        @employees_list = User.all        
    end

    def show
        @employee = User.find(params[:id])
    end
    
    ##crea un nuevo employee
    def create
        ##render plain: params[:post].inspect
        @employee = User.new(employee_params) 
        if(@employee.save)
            redirect_to employee_path(id: @employee)  #Carga la vista show, con ese employee especifico
        else
            render 'new'
        end
    end

    def edit
        @employee = User.find(params[:id])        
    end

    def update
        @employee = User.find(params[:id])

        if(@employee.update(employee_params))
            redirect_to employee_path(id: @employee)  #Carga la vista show, con ese employee especifico
        else
            render 'edit'
        end        
    end

    def destroy
        @employee = User.find(params[:id])
        ##destroy asociated records to that user first
        @cita_list = Appointment.where('user_id = ?', @employee.id)        
        @cita_list.destroy_all
        ## then destroy the user
        @employee.destroy

        redirect_to employees_path    
    end


    ##maneja los parametros que le entran al crear un nuevo employee
    private def employee_params
        params.require(:employees).permit(:email, :password, :password_confirmation)
    end
    


end
