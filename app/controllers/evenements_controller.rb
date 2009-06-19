class EvenementsController < ApplicationController
  before_filter :login_required, :only => [:new, :edit, :destroy]
  uses_tiny_mce :options => { :theme => 'simple' }
  
  # GET /evenements
  # GET /evenements.xml
  def index
    @evenements = Evenement.of_the_month

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @evenements }
    end
  end
  
  def evenenemts_du_jour
    @evenements = Evenement.find(:all, :conditions => ['date = ?', params[:day]])
    
    respond_to do |format|
      format.html { render :action => 'index' }
    end
  end
  
  def evenements_du_mois
    @evenements = Evenement.of_the_given_month(params[:day].to_date)
    
    respond_to do |format|
      format.html {  }
    end
  end

  # GET /evenements/1
  # GET /evenements/1.xml
  def show
    @evenement = Evenement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @evenement }
    end
  end

  # GET /evenements/new
  # GET /evenements/new.xml
  def new
    @evenement = Evenement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @evenement }
    end
  end

  # GET /evenements/1/edit
  def edit
    @evenement = Evenement.find(params[:id])
  end

  # POST /evenements
  # POST /evenements.xml
  def create
    @evenement = Evenement.new(params[:evenement])

    respond_to do |format|
      if @evenement.save
        flash[:notice] = 'Evenement was successfully created.'
        format.html { redirect_to(@evenement) }
        format.xml  { render :xml => @evenement, :status => :created, :location => @evenement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @evenement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /evenements/1
  # PUT /evenements/1.xml
  def update
    @evenement = Evenement.find(params[:id])

    respond_to do |format|
      if @evenement.update_attributes(params[:evenement])
        flash[:notice] = 'Evenement was successfully updated.'
        format.html { redirect_to(@evenement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @evenement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /evenements/1
  # DELETE /evenements/1.xml
  def destroy
    @evenement = Evenement.find(params[:id])
    @evenement.destroy

    respond_to do |format|
      format.html { redirect_to(evenements_url) }
      format.xml  { head :ok }
    end
  end
end
