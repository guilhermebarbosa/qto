require 'will_paginate/array'

class WorksController < ApplicationController
  
  filter_resource_access
  filter_access_to :update_city_select, :send_prevision_email
  
  before_filter :load_page
  before_filter [:load_states], :only=>[:new,:edit, :create, :update]
  before_filter [:load_cities], :only=>[:new,:edit, :create, :update]
  before_filter [:load_status], :only=>[:new,:edit, :create, :update]
  before_filter [:load_companies], :only=>[:new,:edit, :create, :update]

  # GET /works
  # GET /works.json
  def index
    @search = Work.search(params[:search])
    
    @works = @search.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xls do
        render :xls => @works,
               :columns => [ :cei, :name, :address, :number, :district, :cep, :state, :city, :date_initial, :territorial, :cost_center, :footage, :company_id, :responsible, :user_id, :status, :entry, :issue_date, :contact_name, :contact_telephone, :contact_email, :demolition_type, :demolition_km, :floor_qtd, :floor_qtd_km, :floor_units, :floor_units_km, :floor_bathroom, :floor_bathroom_km, :home_club, :home_club_km, :home_ordinance, :home_ordinance_km, :home_support_ordinance, :home_support_ordinance_km ],
               :headers => %w[ CEI Obra Endereço Numero Bairro Cep Estado Cidade Data Inicial Regional Centro de Custo Metragem Empresa Responsável Cadastrado Status Entrada Data de Entrada Contato_Nome Contato_Telefone Contato_Email Demolição_Tipo Demolição_Area Quantidade_de_Pavimento Area_Quantidade_de_Pavimento Quantidade_Unidades Area_Quantidade_Unidades Banheiros Area_Banheiros Clubes Area_Clubes Portaria Area_Portaria Suporte_Portaria Area_Suporte_Portaria ]
      end
    end
  end
  
  def update_city_select
    @cities = City.where(:state_id=>params[:id]).order(:name)
    render :partial => "city", :cities => @cities
  end

  # GET /works/1
  # GET /works/1.json
  def show
    @work_id = params[:id]
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @work }
    end
  end

  # GET /works/new
  # GET /works/new.json
  def new
    1.times { @work.work_documents.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @work }
    end
  end

  # GET /works/1/edit
  def edit
    1.times { @work.work_documents.build }
  end

  # POST /works
  # POST /works.json
  def create
    @work.user_id = current_user.id
    
    if !@work.dwell.blank?
      @work.cnd = @work.dwell + 1.months
    end

    respond_to do |format|
      if @work.save
        
        if current_user.roles[0].name != "Administrador"
          WorkMailer.new_work_alert(@work).deliver
        end
        
        format.html { redirect_to @work, :notice => 'Obra criada com sucesso!' }
        format.json { render :json => @work, :status => :created, :location => @work }
      else
        1.times { @work.work_documents.build }
        load_cities_validate()
        format.html { render :action => "new" }
        format.json { render :json => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /works/1
  # PUT /works/1.json
  def update
    respond_to do |format|
      if @work.update_attributes(params[:work])
        format.html { redirect_to @work, :notice => 'Obra atualizada com sucesso!' }
        format.json { head :no_content }
      else
        1.times { @work.work_documents.build }
        load_cities_validate()
        format.html { render :action => "edit" }
        format.json { render :json => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work.destroy

    respond_to do |format|
      format.html { redirect_to works_url }
      format.json { head :no_content }
    end
  end
  
  private
    def load_page
      @page = "Obra"
      @page_plural = "Obras"
    end
    def load_companies
      @companies = Company.all.collect { |c| [c.name, c.id] }
    end
    def load_states
      @states = State.all.collect { |c| [c.name, c.id] }
    end
    def load_status
      if current_user.roles[0].name == "Administrador"
        @status = ["Aberto", "Fechado"]
      else
        @status = ["Aberto"]
      end
    end
    def load_cities
      if !params[:id].blank?
        work = Work.find(:first, params[:id])
        @cities = City.find(:all, :conditions => [ "state_id = ?", work.state_id ]).collect { |c| [c.name, c.id] }
      else
        @cities = Array.new
      end
    end
    
    def load_cities_validate
      if !@work.state_id.blank?
        @cities = City.find(:all, :conditions => [ "state_id = ?", @work.state_id ]).collect { |c| [c.name, c.id] }
      else
        @cities = Array.new
      end
    end
end