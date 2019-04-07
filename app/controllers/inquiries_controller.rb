class InquiriesController < ApplicationController
# inquiryは本来uncountableだけど、、、、、

# root#contactがinquirys#newを兼ねる
	def create
		@inquiry=Inquiry.new(inquiry_params)
		if @inquiry.save
			@inquiry=Inquiry.new
			flash.now[:contact]="Your message has been sent successfully."
			render 'root/contact', :layout=>'root'
		else
			render 'root/contact', :layout=>'root'
		end
	end

	def destroy
		if judge(current_user)>=3
			inquiry=Inquiry.find(params[:id])
			inquiry.destroy
			redirect_to inquiries_path
		else
			redirect_to post_informations_path
		end
	end

	def index
		if judge(current_user)>=3
			@inquiries=Inquiry.page(params[:page]).reverse_order
		else
			redirect_to post_informations_path
		end
	end

	private

	def inquirys_controller?
		true
	end

	def inquiry_params
			params.require(:inquiry).permit(:name, :content, :email)
	end
end
