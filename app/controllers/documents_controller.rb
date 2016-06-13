require 'json'

class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    if params[:teacher_id].present?
      @documents = Teacher.find(params[:teacher_id]).documents
    else
      @search = DocumentSearch.new(search_params)
      @documents = search_params.present? ? @search.results : Document.all
    end

    respond_to do |format|
      format.html
      format.xml { render :xml => @documents.to_xml() }
      format.json { render :json => @documents.to_json() }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end


  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
#raw("<i class='font-icon font-icon-cloud-upload-2 dz-default dz-message'></i><div class='drop-zone-caption dz-default dz-message'>Drag file to upload</div>")
    name = params[:document][:url].original_filename
    directory = "public/images/upload"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:document][:url].read) }

    @document = Document.new(:description => document_params['description'], :url => params[:document][:url].original_filename,
                             :name => document_params['name'], :tags => document_params['tags'].split(/,/).to_json)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_rating
  end

  def search_params
    params[:thing_search] || {}
  end

  def typeahead
    @search = DocumentSearch.new(typeahead: params[:query])
    render json: @search.results
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def document_params
    params.fetch(:document, {})
  end

end
