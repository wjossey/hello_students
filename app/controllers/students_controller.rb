class StudentsController < ApplicationController
  
  def index
    @students = Student.all

    respond_to do |format|
      format.html
      format.json { render :json => @students }
    end
  end

  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @student}
    end
  end

  def create
    @student = Student.new
    @student.name = params[:student][:name]
    @student.save!

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { render :json => @student }
    end
  end

  def update
    @student = Student.find(params[:id])
    @student.fire_state_event(params[:state_event])

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { render :json => @student }
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.delete

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :ok }
    end
  end

  def good_students
    @students = Student.good_students
    respond_to do |format|
      format.json { render :json => @students }
    end
  end
end
