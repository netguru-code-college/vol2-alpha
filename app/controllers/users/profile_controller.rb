class Users::ProfileController < ApplicationController
  include Wicked::Wizard

  steps :personal, :mentoring

  def show
    @technologies = Technology.all
    @languages = Language.all
    @user = User.find(params[:user_id])
    @levels = Level.all
    render_wizard
  end

  def update
    @user = User.find(params[:user_id])
    @user.update_attributes(user_params)
    if step == :mentoring
      @user.levels.each do |level|
        level.level = params["levels"][level.id.to_s]
        level.save
      end
      redirect_to(root_path) && return
    end
    redirect_to wizard_path(steps.second, user_id: @user.id)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :description,
                                 technology_ids: [],
                                 language_ids: [],
                                 level_ids: [],
                                 technologies_attributes: %i[id name],
                                 languages_attributes: %i[id name],
                                 levels_attributes: %i[id level technology_id user_id])
  end
end
