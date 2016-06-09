class VenuesController < ApplicationController
	before_action :find_venue, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]
	def index 
		if params[:category].blank?
			@venues = Venue.all.order("created_at DESC")
		else
			@category_id= Category.find_by(name: params[:category]).id
			@venues = Venue.where(:category_id => @category_id).order("created_at DESC")
		end
	end 

	def new 
		@venue = current_user.venues.build
		@categories = Category.all.map{ |c| [c.name, c.id]}


	end 

	def create
		@venue = current_user.venues.build(venue_params)
		@venue.category_id = params[:category_id]

		if @venue.save
			redirect_to root_path
		else
			render 'new'
		end

	end


	def show
		if @venue.reviews.blank?
			@average = 0
		else
			@average_review = @venue.reviews.average(:rating).round(2)
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id]}
	end
	def destroy 
		@venue.destroy
		redirect_to root_path
	end


	def update
		@categories = Category.all.map{ |c| [c.name, c.id]}
		if @venue.update(venue_params)
			redirect_to venue_path(@venue)
		else
			redirect_to 'edit'
		end

	end

	private 
		def venue_params
			params.require(:venue).permit(:title, :description, :address, :category_id, :venue_img)
		end

		def find_venue
			@venue =Venue.find(params[:id])
		end

end
