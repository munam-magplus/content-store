class BooksContentAccessRulesController < ApplicationController
  def new
    @book_content_access_rule = BooksSeoConfig.new
  end

  def create
    @book_content_access_rule = BooksSeoConfig.new(content_access_rule_params)
    if @book_content_access_rule.save!
      redirect_to new_book_path
    else
      render 'new'
    end
  end

  private
  def content_access_rule_params
    params.require(:books_seo_config).permit(:territorial_list_type, :territorial_list, 
    :landing_page, :viewability_percentage, :exclude_pages_from_display, :total_free_pages_before_purchase, 
    :total_free_pages_before_purchase, :exclude_pages_from_external_index, :actual_pages_indexable, 
    :actual_browsable_pages, :actual_printable, :actual_allowed_copying_pages, :subject_group, 
    :number_of_page, :free_matter, :first_page_of_full_text, :last_page_of_full_text)
  end
end
