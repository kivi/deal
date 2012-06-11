class DealsController < ApplicationController


  # shows the deal
  def show
    @deal = Deal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deal }
    end
  end

  # adds the deal to the current order or cart
  def order
    deal = Deal.find(params[:id])
    current_order.push(deal)
    redirect_to orders_path, :notice => "#{deal.title} wurde zum Warenkorb hinzugef&uuml;gt".html_safe
  end
  
  # Todo admin
  def index
    @deals = Deal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deals }
    end
  end

  # Todo admin
  def new
    @deal = Deal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deal }
    end
  end

  # Todo admin
  def edit
    @deal = Deal.find(params[:id])
  end

  # Todo admin
  def create
    @deal = Deal.new(params[:deal])

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render json: @deal, status: :created, location: @deal }
      else
        format.html { render action: "new" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # Todo admin
  def update
    @deal = Deal.find(params[:id])

    respond_to do |format|
      if @deal.update_attributes(params[:deal])
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # Todo admin
  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to deals_url }
      format.json { head :no_content }
    end
  end
end
