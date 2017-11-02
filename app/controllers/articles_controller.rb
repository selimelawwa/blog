class ArticlesController < ApplicationController

    #http_basic_authenticate_with name: "selim", password: "pass1", except: [:index, :show]

        def index
        @articles = Article.paginate(page: params[:page], per_page:5)
        end

        def show
            @article = Article.find(params[:id])
        end 
 
        def new 
        @article = Article.new
        end

        def edit
            @article = Article.find(params[:id])
        end

        def create
            @article = Article.new(article_params)
            @article.user = User.find(session[:user_id])
            if @article.save
                flash[:success] = "Article successfully created"
                redirect_to @article
              else
                render 'new'
            end
        end

        def update 
            @article = Article.find(params[:id])
            
             if @article.update(article_params)
                flash[:success] = "Article successfully updated"
               redirect_to @article
             else
               render 'edit'
             end
        end  
    
        def destroy
            @article = Article.find(params[:id])
            @article.destroy
            flash[:danger] = "Article successfully deleted"
            redirect_to articles_path
          end

          private
            def article_params
              params.require(:article).permit(:title, :text)
            end


end
