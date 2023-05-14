class InstructorsController < ApplicationController

    def index
        instuctor = Instructor.all
        render json: instructor, status: :ok
    end

    def create
        instructor = Instructor.create(stud_params)
        render json: instructor, status: :created
    end

    def update
        instructor = Instructor.find_by(id: params[:id])
        if instructor.valid?
            instructor.update(stud_params)
            render json: instructor, status: :ok
        else
            render json: { errors: instructor.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        if instructor.valid?
            instructor.destroy
            head :no_content
        else
            render json: { errors: instructor.errors.full_messages }, status: :unprocessable_entity
        end
    end


    private

    def stud_params
        params.permit(
            :name,
            :major,
            :age
        )

end
