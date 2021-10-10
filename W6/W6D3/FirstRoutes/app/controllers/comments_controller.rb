class CommentsController < ApplicationController
  
  def index
    @comment = Comment.all 
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
    else
      render json: @comment.errors.full_messages, status: 422
    end
end

def destroy
  @comment = Comment.find_by(id: params[:id])
  if @comment 
    @comment.destroy 
    render json: @comment
  else
    render json: { error: "comment doesn't exist"}
  end
end

private 
def comment_params
    params.require(:comment).permit(:artwork_id, :commenter_id)
end

end


# likeable_id : integer
# user_id : integer
# other_id: integer

# class Like < ApplicationRecord

# belongs_to :likeable, polymorphic: true
# belongs_to :user,
#   foreign_key: :user_id,
#   class_name: :User
# end

# class Comment

# has_many :likes, as: :likeable

# end

# class User
  
#   has_many :likes,

# end

# def change
  
#   create_table :likes do |t|
#     t.integer :user_id, null: false
#     t.references :likeable, polymorphic: true, index: true
#   end

# end

# will create a category_id column of the appropriate type. 
# Note that you pass the model name, not the column name. 
# Active Record adds the _id for you. If you have polymorphic
# belongs_to associations then references will add both of the
# columns required: