class HomeController < ApplicationController
  def index
    @posts = Post.all.reverse
    @post_1 = Post.last.content.length # 내용의 글자 수 공백포함
    @post_2 = Post.last.content.length - Post.last.content.count(' ')# 모든 글자수 공백 미포함
    @post_3 = Post.last.content.split(' ').length # 내용의 단어 수
  end
  
  def write
    post = Post.new
    post.title = params[:title]
    post.content = params[:content]

    if  post.save
        redirect_to "/home/index"
    else 
        render :text => post.errors.messages
    end
  end
  
  def reply_write
    reply = Reply.new
    reply.content = params[:reply_content]
    reply.post_id = params[:id_of_post]
    #if
    reply.save
       redirect_to "/home/index"
    #else
     #  render :text => reply.errors.messages
    #end
  end
  
end
