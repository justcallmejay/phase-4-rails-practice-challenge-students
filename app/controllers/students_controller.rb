class StudentsController < ApplicationController

    def index
        student = Student.all
        render json: student, status: :ok
    end

    def create
        student = Student.create(stud_params)
        render json: student, status: :created
    end

    def update
        student = Student.find_by(id: params[:id])
        if student.valid?
            student.update(stud_params)
            render json: student, status: :ok
        else
            render json: { errors: student.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        student = Student.find_by(id: params[:id])
        if student.valid?
            student.destroy
            head :no_content
        else
            render json: { errors: student.errors.full_messages }, status: :unprocessable_entity
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
