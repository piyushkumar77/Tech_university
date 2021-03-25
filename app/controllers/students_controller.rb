class StudentsController <ApplicationController
  def index
     @students =Student.all
  end 

  def new
    @students=Student.new
  end  

  def create
     @students= Student.new(students_params)
     if @students.save
        flash[:success] ="you have successfully signed up"
        redirect_to root_path
     else   
     render 'new'
     end
  end  

private
 def students_params
  params.require(:student).permit(:name,:email)
 end
end    