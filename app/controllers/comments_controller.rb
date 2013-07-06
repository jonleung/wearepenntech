class CommentsController < ApplicationController
  load_and_authorize_resource
  
  # POST /comments
  # POST /comments.json
  def create    
=begin
  for_for nested resource

  if params[:user_id]; User.find(params[:user_id]); else ... end
=end
    commentable_klass = params[:comment][:commentable_type].capitalize.constantize
    commentable_id = params[:comment][:commentable_id]
    commentable = commentable_klass.find(commentable_id)

    @comment = commentable.comments.build(params[:comment].slice(:text))
    @comment.creator = current_user
    @comment.image_url = current_user.default_image_url
    @comment.author = "#{current_user.first_name} #{current_user.last_name}"

    respond_to do |format|
      if @comment.save
        format.html { redirect_to url_for(commentable), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        debugger
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

end