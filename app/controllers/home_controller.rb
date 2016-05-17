class HomeController < ApplicationController
  def index
    @posts = Post.all.reverse
    @postsAll = Post.last.content.length # 내용의 글자 수 공백포함
    #@post = Post.last.content.length - Content.last.content.count(' ')# 모든 글자수 공백 미포함
    @post = Post.last.content.split(' ').length # 내용의 단어 수
  end
  
  def write
    post = Post.new
    post.title = params[:title]
    post.content = params[:content]

    if  post.save
        redirect_to "/home/index"
    else 
        render :text => post.errors.messages[:title.first]
    end
  end
  
  def reply_write
    reply = Reply.new
    reply.content = params[:replycontent]
    reply.post_id = params[:postcontent]
    reply.save
    
    redirect_to "/home/index"
  end
end
