class UsersController < ApplicationController
	helper_method :sort_column, :sort_direction

	def edit
		if judge(current_user)>=4
			@user=User.find(params[:id])
		else
			redirect_to users_path
		end
	end

	def update
		@user=User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user)
	end


	def show
		@user=User.find(params[:id])
	end

# 現状Status関係なく全会員を渡している
	def index
		# @users=User.all.order(sort_column + ' ' + sort_direction)
		@users=User.search(params[:search]).order(sort_column + ' ' + sort_direction)
	end
	
	# 以下自分でルート定義
	def numbers
		if judge(current_user)>=3
			@users=User.all
		else
			redirect_to users_path
		end
	end
# 中コミ権限一括変更限定
# 2019/4/1 ver 変更必要　権限追加など
	# def edit_all
	# 	@users=User.search(params[:search]).order(sort_column + ' ' + sort_direction)
	# 	# @users=User.search(params[:tgcontent]).order(sort_column + ' ' + sort_direction)
	# end

	# def update_all
	# 	# @users=User.search(params[:search])
	# 	@users=User.search(params[:search])
	# 	@users.update_all( params[:column] = params[:content] )
	# 	redirect_to users_path
	# end

	private
		def user_params
   		 params.require(:user).permit(:firstname, :lastname, :section, :authority, :home, :status, :faculty, :grade, :ruby_firstname, :ruby_lastname, :char_firstname, :char_lastname)
		end

		def sort_direction
		 %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
		end

		def sort_column
		 User.column_names.include?(params[:sort]) ? params[:sort] : "grade"
		end
end
