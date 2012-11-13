class StudentsController < ApplicationController
  
  #Lists ALL of the students
  def index
    @students = Student.all

    respond_to do |format|
      format.html
      format.json { render :json => @students }
    end
  end

  #Gives me information about one of the students
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @student}
    end
  end

  #Lets me add new students
  def create
    @student = Student.new
    @student.name = params[:student][:name]
    @student.save!

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { render :json => @student }
    end
  end

  #Lets me update a student
  def update
    @student = Student.find(params[:id])
    @student.fire_state_event(params[:state_event])

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { render :json => @student }
    end
  end

  #Destroys a student
  def destroy
    @student = Student.find(params[:id])
    @student.delete

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :ok }
    end
  end

  #Returns all of the good students in a JSON hash
  def good_students
    @students = Student.good_students
    respond_to do |format|
      format.json { render :json => @students }
    end
  end
end
