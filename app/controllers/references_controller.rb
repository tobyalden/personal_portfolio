class ReferencesController < ApplicationController

  def index
    @references = Reference.all
    respond_to do |format|
      format.html { redirect_to references_path }
      format.js
    end
  end

  def create
    @reference = Reference.new(reference_params)
    @reference.save
    redirect_to root_path
  end

  private
	def reference_params
		params.require(:reference).permit(:body)
	end

end
