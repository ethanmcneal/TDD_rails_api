class ArticlesController < ApplicationController

    def index
        articles = Article.recent
        paginated = paginator.call(
            articles,
            params: pagination_params,
            base_url: request.url
        )
        render json: articles
    end

    def paginator 
        JSOM::Pagination::Paginator.new
    end

    def pagination_params
        params.permit![:page]
    end
end
