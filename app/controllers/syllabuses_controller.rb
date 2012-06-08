class SyllabusesController < ApplicationController
  # GET /syllabuses
  # GET /syllabuses.xml
  def index
    @syllabuses = Syllabus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @syllabuses }
    end
  end

  # GET /syllabuses/1
  # GET /syllabuses/1.xml
  def show
    @syllabus = Syllabus.find(params[:id])
    @missions = @syllabus.missions.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @syllabus }
    end
  end

  # GET /syllabuses/new
  # GET /syllabuses/new.xml
  def new
    @syllabus = Syllabus.new

    missions = @syllabus.missions.build

    @missions = Mission.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @syllabus }
    end
  end

  # GET /syllabuses/1/edit
  def edit
    @syllabus = Syllabus.find(params[:id])

    @missions = Mission.find(:all)
  end

  # POST /syllabuses
  # POST /syllabuses.xml
  def create
    @syllabus = Syllabus.new(params[:syllabus])

    respond_to do |format|
      if @syllabus.save
        format.html { redirect_to(@syllabus, :notice => 'Syllabus was successfully created.') }
        format.xml  { render :xml => @syllabus, :status => :created, :location => @syllabus }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @syllabus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /syllabuses/1
  # PUT /syllabuses/1.xml
  def update
    @syllabus = Syllabus.find(params[:id])

    respond_to do |format|
      if @syllabus.update_attributes(params[:syllabus])
        format.html { redirect_to(@syllabus, :notice => 'Syllabus was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @syllabus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /syllabuses/1
  # DELETE /syllabuses/1.xml
  def destroy
    @syllabus = Syllabus.find(params[:id])
    @syllabus.destroy

    respond_to do |format|
      format.html { redirect_to(syllabuses_url) }
      format.xml  { head :ok }
    end
  end
end
