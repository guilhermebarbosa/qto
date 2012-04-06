require 'will_paginate/array'

class UsersController < ApplicationController
  filter_resource_access
  
  before_filter [:load_roles], :only=>[:new,:edit, :create, :update]
  before_filter [:load_page]
  
  def index
    @search = User.search(params[:search])
    
    @users = @search.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  # GET /users/new
  # GET /users/new.json
  def new
    #@user = User.new
  end
  
  def create
    #@user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Usuário registrado com sucesso!"
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  # GET /companies/1/edit
  def edit
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        if !params[:user][:role_ids].blank?
          format.html { redirect_to @user, :notice => 'Company was successfully updated.' }
        else
          format.html { redirect_to root_url, :notice => 'Company was successfully updated.' }
        end
        
      else
        format.html { render :action => "edit" }
        format.json { render :json => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit_profile
  end

  def update_profile
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  private
    def load_roles
      @roles = Role.all
    end
    def load_page
      @page = "Usuário"
      @page_plural = "Usuários"
    end
end