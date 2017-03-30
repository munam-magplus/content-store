Tabulous.setup do

  tabs do

    site_settings_site_setting_tab do
      text          { 'Site Settings Site Setting' }
      link_path     { site_settings_site_setting_index_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('site_settings/site_setting') }
    end

    retailers_tab do
      text          { 'Retailers' }
      link_path     { retailers_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('retailers') }
    end

    institution_user_tab do
      text          { 'Institution User' }
      link_path     { institution_user_index_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('institution_user') }
    end

    institution_tab do
      text          { 'Institution' }
      link_path     { institution_index_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('institution') }
    end

    access_tokens_tab do
      text          { 'Access Tokens' }
      link_path     { access_tokens_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('access_tokens') }
    end

    campaigns_tab do
      text          { 'Campaigns' }
      link_path     { campaigns_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('campaigns') }
    end

    publishers_tab do
      text          { 'Publishers' }
      link_path     { publishers_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('publishers') }
    end

    license_groups_tab do
      text          { 'License Groups' }
      link_path     { license_groups_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('license_groups') }
    end

    licenses_tab do
      text          { 'Licenses' }
      link_path     { licenses_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('licenses') }
    end

    subscriptions_tab do
      text          { 'Subscriptions' }
      link_path     { subscriptions_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('subscriptions') }
    end

    subject_groups_tab do
      text          { 'Subject Groups' }
      link_path     { subject_groups_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('subject_groups') }
    end

    content_conversation_tab do
      text          { 'Content Conversation' }
      link_path     { content_conversation_index_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('content_conversation') }
    end

    countries_tab do
      text          { 'Countries' }
      link_path     { countries_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('countries') }
    end

    reports_tab do
      text          { 'Reports' }
      link_path     { reports_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('reports') }
    end

    printhouse_setup_tab do
      text          { 'Printhouse Setup' }
      link_path     { printhouse_setup_index_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('printhouse_setup') }
    end

    manage_access_tab do
      text          { 'Manage Access' }
      link_path     { manage_access_index_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('manage_access') }
    end

    manage_user_account_tab do
      text          { 'Manage User Account' }
      link_path     { manage_user_account_index_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('manage_user_account') }
    end

    publisher_setup_tab do
      text          { 'Publisher Setup' }
      link_path     { publisher_setup_index_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('publisher_setup') }
    end

    end_user_tab do
      text          { 'End User' }
      link_path     { end_user_index_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('end_user') }
    end

    promo_codes_tab do
      text          { 'Promo Codes' }
      link_path     { promo_codes_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('promo_codes') }
    end

  end

  customize do

    # which class to use to generate HTML
    # :default, :html5, :bootstrap, :bootstrap_pill or :bootstrap_navbar
    # or create your own renderer class and reference it here
    # renderer :default

    # whether to allow the active tab to be clicked
    # defaults to true
    # active_tab_clickable true

    # what to do when there is no active tab for the current controller action
    # :render -- draw the tabset, even though no tab is active
    # :do_not_render -- do not draw the tabset
    # :raise_error -- raise an error
    # defaults to :do_not_render
    # when_action_has_no_tab :do_not_render

    # whether to always add the HTML markup for subtabs, even if empty
    # defaults to false
    # render_subtabs_when_empty false

  end

  # The following will insert some CSS straight into your HTML so that you
  # can quickly prototype an app with halfway-decent looking tabs.
  #
  # This scaffolding should be turned off and replaced by your own custom
  # CSS before using tabulous in production.
  use_css_scaffolding do
    background_color '#ccc'
    text_color '#444'
    active_tab_color '#fff'
    hover_tab_color '#ddd'
    inactive_tab_color '#aaa'
    inactive_text_color '#888'
  end

end
