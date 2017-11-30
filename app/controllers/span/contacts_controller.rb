# apps/controllers/span/contacts_controller.rb

module Span
  class ContactsController < Span::ApplicationController
    include Resources

    # GET span/contacts
    def index
      @contacts = ContactDecorator.decorate_collection Contact.published_all
      render :index
    end

    # GET span/contacts/all
    def all
      @contacts = ContactDecorator.decorate_collection Contact.list_all
      render :index
    end

    # GET span/contacts/unpublished
    def unpublished
      @contacts = ContactDecorator.decorate_collection Contact.unpublished_all
      render :index
    end

    # GET span/contacts/new
    def new
      @contact = Contact.new
    end

    # POST span/contacts
    def create
      @contact = Contact.new contact_params
      @positions = Contact.pluck(:position).compact
      @positions << 0
      @contact.position = (@positions.min - 1)
      if @contact.save
        flash[:success] = "Contact was successfully created."
        redirect_to span.contacts_path
      else
        render :new
      end
    end

    # GET span/contacts/slug/edit
    def edit
    end

    # PATCH/PUT span/contacts/slug
    def update
      if @contact.update(contact_params)
        flash[:success] = "Contact was successfully updated."
        redirect_to span.edit_contact_path(@contact)
      else
        render :edit
      end
    end

    # GET span/contacts/slug/seo_settings
    def seo_settings
    end

    # PATCH/PUT span/contacts/slug
    def update_seo_settings
      if @contact.update_attributes contact_params
        flash[:success] = "SEO Settings were successfully updated."
        redirect_to span.seo_settings_contact_path(@contact)
      else
        render :edit
      end
    end

    # DELETE span/contacts/slug
    def destroy
      @contact.destroy
      flash[:success] = "Contact was successfully destroyed."
      redirect_to span.contacts_path
    end

    # SORTABLE span/contacts
    def sortable
      Contact.sort_position params[:contact]
      render nothing: true
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resources
      @contact = Contact.find_by_slug! params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(
        :title,
        :name,
        :surname,
        :address,
        :country,
        :city,
        :postcode,
        :fax,
        :phone,
        :mobile,
        :email,
        :path,
        :pathname,
        :imagebox,
        :remove_imagebox,
        :position,
        :published,

        # SEO Settings
        :seo_title,
        :seo_description,
        :seo_tags,
        :seo_imagebox
      )
    end
  end
end
