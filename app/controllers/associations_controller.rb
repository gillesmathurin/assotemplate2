class AssociationsController < ApplicationController
  before_filter :admin_login_required, :only => [:new, :edit, :destroy]
  uses_tiny_mce :options => {:theme => 'simple'}
  
  # GET /associations
  # GET /associations.xml
  def index
    @association = Association.first
    @articles = Article.of_the_week
    @evenements = Evenement.to_come
    @galleries = Gallery.last_four

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @association }
    end
  end
  
  def contact    
  end
  
  # GET /associations/1
  # GET /associations/1.xml
  def show
    @association = Association.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @association }
    end
  end

  # GET /associations/new
  # GET /associations/new.xml
  def new
    @association = Association.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @association }
    end
  end

  # GET /associations/1/edit
  def edit
    @association = Association.find(params[:id])
  end

  # POST /associations
  # POST /associations.xml
  def create
    @association = Association.new(params[:association])

    respond_to do |format|
      if @association.save
        flash[:notice] = 'Association was successfully created.'
        format.html { redirect_to(@association) }
        format.xml  { render :xml => @association, :status => :created, :location => @association }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /associations/1
  # PUT /associations/1.xml
  def update
    @association = Association.find(params[:id])

    respond_to do |format|
      if @association.update_attributes(params[:association])
        flash[:notice] = 'Association was successfully updated.'
        format.html { redirect_to(@association) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /associations/1
  # DELETE /associations/1.xml
  def destroy
    @association = Association.find(params[:id])
    @association.destroy

    respond_to do |format|
      format.html { redirect_to(associations_url) }
      format.xml  { head :ok }
    end
  end
end
