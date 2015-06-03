RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard  
                       # mandatory
    index do                        # mandatory
      controller do
        proc do
          @objects = @abstract_model.where('isnull(is_delete) or is_delete = 0')
        end
      end
    end
    new
    # export
    # bulk_delete
    show
    edit
    # show_in_app
    delete do
      controller do
        proc do
          if request.delete? # delete
            @object.is_delete =1

            @object.set_attributes(params[@abstract_model.param_key])
            @authorization_adapter && @authorization_adapter.attributes_for(:destroy, @abstract_model).each do |name, value|
              @object.send("#{name}=", value)
            end              

            if @object.save
              @auditing_adapter && @auditing_adapter.create_object(@object, @abstract_model, _current_user)
              respond_to do |format|
                format.html { redirect_to_on_success }
                format.js   { render json: {id: @object.id.to_s, label: @model_config.with(object: @object).object_label} }
              end
            else
              handle_save_error
            end
          end
        end
      end
    end


    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end



  #nguyentamphu
  # Slider
  # config.model Admin do
  #   edit do
  #     include_all_fields
  #     exclude_fields :is_delete
  #   end
  #   list do
  #     include_all_fields
  #      exclude_fields :is_delete, :created_at, :updated_at
  #   end
  # end

  config.model Slider do
      

    list do
      include_all_fields
      field :image do
        thumb_method :thumbnail
      end
      exclude_fields :is_delete
    end

    edit do
      # For RailsAdmin >= 0.5.0
      include_all_fields
      field :image do
        thumb_method :thumbnail
      end
      exclude_fields :is_delete
      # For RailsAdmin < 0.5.0
      # field :description do
      #   ckeditor true
      # enum_method
    end
  end

  # Slider
  config.model Rating do
    edit do
      include_all_fields
      field :rating, :enum do
        enum_method do 
          :my_rating_enum_instance_method
        end

        enum do
          [1,2,3,4,5]
        end
      end
    end
  end
  #trivv
   config.model Account do
    edit do
      # For RailsAdmin >= 0.5.0
      field :role, :enum do 
        # if your model has a method that sends back the options:
        enum_method do
          :my_role_enum_instance_method
        end
        #default vallue
        default_value 'admin'
        # or doing it directly inline
        enum do
          # simple array
          ['admin', 'user']
        end
      end
      include_all_fields
      field :gender, :enum do 
        # if your model has a method that sends back the options:
        enum_method do
          :my_gender_enum_instance_method
        end
        #default vallue
        default_value 'Male'
        # or doing it directly inline
        enum do
          # simple array
          {'Female'=>0, 'Male'=>1}
        end
      end
      
    end
    list do
      # For RailsAdmin >= 0.5.0
      fields :id, :full_name, :role, :email, :tel, :birthday, :address, :gender
       exclude_fields :is_delete, :created_at, :updated_at, :image, :orders, :ratings
      # For RailsAdmin < 0.5.0
      # field :description do
      #   ckeditor true
      # end
    end
  end

  config.model Adv do
    edit do
      include_all_fields
      exclude_fields :is_delete
    end
    list do

      include_all_fields
      field :image do
        thumb_method :thumbnail
      end
       exclude_fields :is_delete, :created_at, :updated_at
    end
  end
  config.model Article do
    edit do
      
      field :detail, :ck_editor
      exclude_fields :is_delete
      include_all_fields
    end
    list do
      include_all_fields
       exclude_fields :is_delete, :created_at, :updated_at
    end
  end

  config.model Banner do
    edit do
      include_all_fields
      exclude_fields :is_delete
    end
    list do
      include_all_fields
       exclude_fields :is_delete, :created_at, :updated_at
    end
  end

  config.model Brand do
    edit do
      include_all_fields
      exclude_fields :is_delete
    end
    list do
      include_all_fields
       exclude_fields :is_delete, :created_at, :updated_at
    end
  end

  config.model Category do
    edit do
      field :parent_id, :enum do 
        enum_method do
          :my_parent_enum_instance_method
        end
        # or doing it directly inline
        enum do
          Category.where('isnull(parent_id)').map { |c| [ c.name, c.id ] }
        end
      end
      include_all_fields
      exclude_fields :is_delete
    end

    list do
      include_all_fields
      exclude_fields :is_delete
    end
  end

  config.model ProductImage do
    edit do
      field :image do
        thumb_method :thumbnail
      end
      include_all_fields
      exclude_fields :is_delete
    end

    list do
        include_all_fields
      field :image do
        thumb_method :thumbnail
      end
      exclude_fields :is_delete
    end
    
  end





config.model Product do
    edit do
      include_all_fields
      field :detail, :ck_editor
      exclude_fields :is_delete
    end
    list do
      include_all_fields
       exclude_fields :is_delete, :created_at, :updated_at
    end
  end

  config.model Contact do
    edit do
      include_all_fields
      exclude_fields :is_delete
    end
    list do
      include_all_fields
       exclude_fields :is_delete, :created_at, :updated_at
    end
  end

  config.model Order do
    edit do
      include_all_fields
      exclude_fields :is_delete
    end
    list do
      include_all_fields
       exclude_fields :is_delete, :created_at, :updated_at
    end
  end

  config.model OrdersDetail do
    edit do
      include_all_fields
      exclude_fields :is_delete
    end
    list do
      include_all_fields
       exclude_fields :is_delete, :created_at, :updated_at
    end
  end

  config.model Post do
    create do
      include_all_fields
      exclude_fields :is_delete
      field :detail, :ck_editor
    end
    list do
      include_all_fields
       exclude_fields :is_delete, :created_at, :updated_at
    end
  end

  config.model Product do
    create do
      include_all_fields
      exclude_fields :is_delete
      field :detail, :ck_editor
    end
    list do
      include_all_fields
       exclude_fields :is_delete, :created_at, :updated_at
    end
  end
end
