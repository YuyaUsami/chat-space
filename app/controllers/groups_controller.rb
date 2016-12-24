class GroupsController < ApplicationController
  class Post
    include ActiveModel::Model

    attr_accessor :persons
  end

  class Person
    include ActiveModel::Model

    attr_accessor :a_name
  end

  class Group
    include ActiveModel::Model

    attr_accessor :name
  end

  def new
    persons = [Person.new(a_name: '宇佐見祐也'), Person.new(a_name: '宇佐見祐也')]
    @person = Post.new(persons: persons)
    @group = Group.new
  end

  def create
    Group.create(create_params)
    redirect_to controller: :messages , action: :index
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
  end

  def confirm
    p post_parms
  end

  private
  def create_params
    params.require(:group).permit(:name)
  end

  def post_parms
    params.require(:groups_controller_post).permit(persons: [])
  end
end
