class CommentsController < ApplicationController
  filter_resource_access
  filter_access_to :new_comment
  
  def new_comment
    @comment = Comment.new(:work_id => params[:work_id])
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    
    @comment.user = current_user
  
    respond_to do |format|
      if @comment.save
        format.html { redirect_to work_url(@comment.work_id), :notice => 'Comment was successfully created.' }
      else
        format.html { render :action => "new_comment" }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to work_url(@comment.work_id), :notice => 'Comment was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to work_url(@comment.work_id) }
    end
  end
end
