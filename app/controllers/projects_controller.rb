class ProjectsController < ApplicationController

    before_action :authenticate_user!
    load_and_authorize_resource
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
      
       # @projects=Project.all
       if params.present?
        @projects = Project.where('LOWER(name) LIKE ?', "%#{params["query"]}%")


       else
        @projects = Project.accessible_by(current_ability)
       end
        

        #@projects = current_user.projects
        respond_to do |format|
          format.html { render 'index' }
          format.json { render json: @projects }
        end
        
        end
      
        def show
          @project=Project.find(params[:id])
          
          
        end
      
        def edit
          @project=Project.find(params[:id])
      
        end
      
        def new
          @project=Project.new
          

        end
      
        def create
          
          @project = Project.new(project_params)
          @project.creator_id = current_user.id

          if @project.save
            @user = User.find(@project.user_id) 
    MyFirstJob.perform_in(5.seconds, @project.user_id) 
    UserMailer.welcome_email(@user, @project).deliver_now 


            redirect_to projects_path, notice: 'Project was successfully created.'
          else
            render :new, status: :unprocessable_entity
          end
        end
      
      
      
        def destroy
          @project = Project.find(params[:id])
          @project.destroy
      
          redirect_to root_path, status: :see_other
        end
        
        def edit
          @project=Project.find(params[:id])
        end
        

        def update
          @project=Project.find(params[:id])
          
      
          if @project.update(project_params)
            
            current_user = User.find(params[:project][:user_id])
            update_details = "Project '#{params[:project][:name]}' has been updated."
            MySeconedJob.perform_async(@project.id, current_user.id, update_details)       
            
            redirect_to @project, notice: 'Project was successfully updated.'
      
          else
            render :edit, status: :unprocessable_entity
          end
        end
        
        
  
         
      
        
         private
         
         
      
       
        
      def project_params
       # params.require(:project).permit(:name, users_attributes: [:id,:user_id, :name, :email])
       params.require(:project).permit(:name,:description, :query, :user_id, :creator_id, users_attributes: [:id, :name, :email])

      end
      
   def set_project
    @project = Project.find(params[:id])
  end


  

  
end 

    


