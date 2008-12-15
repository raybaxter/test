class ChemicalsController < ApplicationController

  def index
    @chemicals = Chemical.find(:all, :include => :vendor)
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def show
    @chemical = Chemical.find(params[:id], :include => :vendor)
  
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def new
    @chemical = Chemical.new
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def edit
    @chemical = Chemical.find(params[:id])
  end
  
  def create
    @chemical = Chemical.new(params[:chemical])

    respond_to do |format|
      if @chemical.save
        flash[:notice] = 'Chemical was successfully created.'
        format.html { redirect_to(@chemical) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @chemical = Chemical.find(params[:id], :include=>:vendor)
  
    respond_to do |format|
      if @chemical.update_attributes(params[:chemical])
        flash[:notice] = 'Chemical was successfully updated.'
        format.html { redirect_to(@chemical) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @chemical = Chemical.find(params[:id])
    @chemical.destroy
  
    respond_to do |format|
      format.html { redirect_to(chemicals_url) }
      format.xml  { head :ok }
    end
  end
end
