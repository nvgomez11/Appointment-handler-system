require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
    context "GET #index" do
        it "returns a success response" do
            get :index
            expect(response).to be_success            
        end
    end

    context "admin user loged in" do
        it "able to create new appointment" do
            appointment = Appointment.create!(user_id: 3, my_date: "2019-07-11T21:00:00.000Z")
            get :create, params: { id: appointment.to_param }
        end        
    end
        
end
