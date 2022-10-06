RailsAdmin.config do |config|
  config.asset_source = :webpacker
 
  
  require Rails.root.join('lib', 'rails_admin', 'approve_user.rb')
  RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::ApproveUser)
  
  RailsAdmin.config do |config|
    config.authorize_with do
      redirect_to main_app.root_path unless current_user.admin?
    end
  end
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  


  config.actions do
    
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show 
    edit
    delete
    show_in_app
    approve_user
    approve_post
  config.model 'Post' do
  
   
      show do
        field :user
        field :status
       field :comments do
        # formatted_value do
        #   bindings[:object].comments
        # end
        pretty_value do
         @post = Post.find(bindings[:object].id)
         com=@post.comments.pluck(:description)
         
         com.each do|c|
             end
        #  @post.comments..each do|c|
        # c.description
         #  end
        # p= Comment.group(:post_id).count

        #  @c =  Comment.where(post_id: @post.id)
        # if (@c.post_id == @post.id)
        #      @c.description
        #  end
        
      #    utils = @post.comments
      #    %{<div class="blah">
      #     #{utils.select{|u|u.description}}
      #   </div >}
      
      # children_fields [utils.each_with_index do|u|u.description end]
          # bindings[:view].content_tag(:a, bindings[:object].description)
       
        # formatted_value.html_safe? { render :text => c.html_content }
        
         end
      end
        # field :comments do
        #   pretty_value do
        #     path = bindings[:description].post_path(model_name: 'Post', id: bindings[:object].id)
        #     bindings[:view].content_tag(:a, bindings[:object].description, href: path)
        #   end
        # end
        field :user_id
        field :images
      end
      
  end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end