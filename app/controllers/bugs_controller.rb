class BugsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    before_action :set_bug, only: [:show, :edit, :update, :destroy,:assign]

    def index
       # @bugs=Bug.all
        @bugs = Bug.accessible_by(current_ability)
        
        end
      
        def show
          @bug=Bug.find(params[:id])
        end
      
        def edit
          @bug=Bug.find(param[:id])
          @projects = Project.all

      
        end
      
        def new
          @bug=Bug.new
          @projects = Project.all

        end
      
        def create
          @bug = Bug.new(bug_params)
          @bug.creator_id = current_user.id

          
          

          if @bug.save
            user = @bug.user
            MyBugCreationJob.perform_async(@bug.id, user.id)
            redirect_to @bug, notice: 'Bug was successfully created.'
          
    
           else
            @projects = Project.all 
            render :new, status: :unprocessable_entity
          end
        end
      
      
      
        def destroy
          @bug = Bug.find(params[:id])
          @bug.destroy
      
          redirect_to root_path, status: :see_other
        end
        
        def edit
          @bug=Bug.find(params[:id])
        end
      
        def update
          @bug=Bug.find(params[:id])
          
      
          if @bug.update(bug_params)
            redirect_to @bug
          else
            render :edit, status: :unprocessable_entity
          end
        end

        def assign
          @bug.update(user_id: current_user.id)
          redirect_to bugs_path, notice: 'Bug was successfully assigned to yourself.'
        end
      
         private
      
      def bug_params
        params.require(:bug).permit(:title, :description,:deadline,:bug_type,:status,:avatar,:user_id, :project_id,:creator_id)
      
      end
      def set_bug
        @bug = Bug.find(params[:id])
      end

      

     
      
end
