require 'will_paginate/array'

class CompaniesController < ApplicationController
  filter_resource_access
  
  before_filter :load_page
  
  # GET /companies
  # GET /companies.json
  def index
    @search = Company.search(params[:search])
    
    @companies = @search.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @company }
    end
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, :notice => 'Company was successfully created.' }
        format.json { render :json => @company, :status => :created, :location => @company }
      else
        format.html { render :action => "new" }
        format.json { render :json => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, :notice => 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end
  
  private
    def load_page
      @page = "Empresa"
      @page_plural = "Empresas"
    end
end
