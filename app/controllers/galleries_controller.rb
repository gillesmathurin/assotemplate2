class GalleriesController < ApplicationController
  before_filter :find_membre
  uses_tiny_mce :options => {:theme => 'simple'}
  
  # GET /galleries
  # GET /galleries.xml
  def index
    @galleries = @membre.galleries.last_four

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.xml
  def show
    if @membre
      @gallery = @membre.galleries.find(params[:id])
    else
      @gallery = Gallery.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.xml
  def new
    @gallery = @membre.galleries.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = @membre.galleries.find(params[:id])
  end

  # POST /galleries
  # POST /galleries.xml
  def create
    @gallery = @membre.galleries.build(params[:gallery])

    respond_to do |format|
      if @gallery.save
        flash[:notice] = 'Gallery was successfully created.'
        format.html { redirect_to user_gallery_path(@membre, @gallery) }
        format.xml  { render :xml => @gallery, :status => :created, :location => @gallery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.xml
  def update
    @gallery = @membre.galleries.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        flash[:notice] = 'Gallery was successfully updated.'
        format.html { redirect_to(@gallery) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.xml
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to(user_galleries_url(@membre)) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_membre
    @membre = User.find(params[:user_id]) if params[:user_id]
  end
end
