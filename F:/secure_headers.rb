
SecureHeaders::Configuration.default do |config|
    config.csp = {
      default_src: %w('self'),
      script_src: %w('self' 'unsafe-inline'),
      style_src: %w('self' 'unsafe-inline'),
      img_src: %w('self' data:),
      connect_src: %w('self'),
      font_src: %w('self'),
      object_src: %w('none'),
      media_src: %w('self'),
      frame_src: %w('self'),
      child_src: %w('self'),
      form_action: %w('self'),
      base_uri: %w('self'),
      frame_ancestors: %w('none'),
      block_all_mixed_content: true,
      upgrade_insecure_requests: true,
      report_uri: %w(/csp_report)
    }
    config.hsts = "max-age=#{1.week.to_i}"
    config.x_frame_options = 'DENY'
    config.x_content_type_options = 'nosniff'
    config.x_xss_protection = '1; mode=block'
    config.x_download_options = 'noopen'
    config.x_permitted_cross_domain_policies = 'none'
  end
  
  