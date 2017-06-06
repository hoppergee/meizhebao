class CourseoneslessononesController < ApplicationController
  before_action :authenticate_user!, :only => [:create, :destroy]

  def index
    @courseoneslessonones = Courseoneslessonone.order("id DESC").all    # 新贴文放前面
  end

     def create
     @courseoneslessonone = Courseoneslessonone.new(courseoneslessonone_params)
     @courseoneslessonone.user = current_user
     @courseoneslessonone.save


   end

   def destroy
     @courseoneslessonone = current_user.courseoneslessonones.find(params[:id]) # 只能删除自己的贴文
     @courseoneslessonone.destroy


   end

   protected

   def courseoneslessonone_params
     params.require(:courseoneslessonone).permit(:content)
    end
end
