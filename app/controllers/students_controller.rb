class StudentsController <ApplicationController
  def index
     @students =Student.all
  end 
 
  def show
     @students=Student.find(params[:id])
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

  def edit
   @students=Student.find(params[:id])
  end 

  def update
   @students=Student.find(params[:id])
   if@students.update(students_params)
     flash[:notice]="you have successfully uodated your profile"
     redirect_to student_path(@students)
   else
      render 'edit'
   end    
  end

private
 def students_params
  params.require(:student).permit(:name,:email)
 end
end    