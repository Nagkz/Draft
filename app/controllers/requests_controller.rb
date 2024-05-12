class RequestsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin, only: [:edit, :destroy, :show]

    def show
        @requests = Request.all
    end
    
    def new
      @request = Request.new
    end
  
        def create
          @request = current_user.requests.build(request_params)
          if @request.save
            redirect_to root_path, notice: 'お問い合わせが投稿されました'
          else
            # エラー処理
          end
        end

    def destroy
        request = Request.find(params[:id])
        request.destroy
    end
  
    private

    def request_params
      params.require(:request).permit(:purpose, :body)
    end

    def authorize_admin
        redirect_to root_path, alert: "管理者のみがアクセスできます" unless current_user.admin?
    end
end