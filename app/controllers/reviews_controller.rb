class ReviewsController < ApplicationController
	before_action :find_venue
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]
	def new 
		@review = Review.new
	end

	def create
		@review =Review.new(review_params)
		@review.venue_id =@venue.id
		@review.user_id = current_user.id
		if @review.save
			redirect_to venue_path(@venue)
		else
			render 'new'
		end

	end

	def destroy
		@review.destroy
		redirect_to venue_path(@venue)
	end


	def edit
		

	end

	def update
		

		if @review.update(review_params)
			redirect_to venue_path(@venue)
		else
			render 'edit'
		end

	end


	private
		def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def find_venue
			@venue = Venue.find(params[:venue_id])
		end

		def find_review
			@review = Review.find(params[:id])
		end


end
