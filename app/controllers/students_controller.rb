class StudentsController <ApplicationController
   before_action :set_student, only:[:show,:edit,:update]
  def index
     @students =Student.all
  end 
 
  def show
    
 end

  def new
    @students=Student.new
  end  

  def create
     @students= Student.new(students_params)
     if @students.save
        flash[:success] ="you have successfully signed up"
        redirect_to @students
     else   
     render 'new'
     end
  end  

  def edit

  end 

  def update
   if@students.update(students_params)
     flash[:notice]="you have successfully uodated your profile"
     redirect_to student_path(@students)
   else
      render 'edit'
   end    
  end

private

def set_student
   @students=Student.find(params[:id])
end   

 def students_params
  params.require(:student).permit(:name,:email, :password, :password_confirmation)
 end
end    