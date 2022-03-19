class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

     #GET /apartments
    def index 
        instructors = Instructor.all
        render json: instructors
    end

     #GET  /apartments/:id
    def show
        instructor = Instructor.find(params[:id])
        render json: instructor
    end

    #POST /apartments
    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    #PATCH /apartments/:id
    def update
        instructor = Instructor.find(params[:id])
        instructor.update!(instructor_params)
        render json: instructor, status: :ok
    end

    #DESTROY /birds/:id
    def destroy
        instructor = Instructor.find(params[:id])
        instructor.destroy
        head :no_content
    end

    private
    
    def instructor_params
        params.permit(:name)
    end

    #show, update, destroy
    def render_not_found_response(error)
        render json: {errors: "#{error.model} Not Found"}, status: :not_found
    end

    #create
    def render_unprocessable_entity(invalid)
        render json: {error: invalid.message}, status: :unprocessable_entity
                # {error: invalid.record.errors},
    end
end
