module Capybara
  class << self
    attr_writer :default_driver, :current_driver, :javascript_driver

    attr_accessor :app

    def default_driver
      @default_driver || :rack_test
    end

    def current_driver
      @current_driver || default_driver
    end
    alias_method :mode, :current_driver

    def javascript_driver
      @javascript_driver || :selenium
    end

    def use_default_driver
      @current_driver = nil
    end

    def current_session
      session_pool["#{current_driver}#{app.object_id}"] ||= Capybara::Session.new(current_driver, app)
    end

    def current_session?
      session_pool.has_key?("#{current_driver}#{app.object_id}")
    end

    def reset_sessions!
      @session_pool = nil
    end

  private

    def session_pool
      @session_pool ||= {}
    end
  end

  extend(self)

  def page
    Capybara.current_session
  end

  SESSION_METHODS = [
    :visit, :current_url, :body, :click_link, :click_button, :drag, :fill_in,
    :choose, :has_xpath?, :has_no_xpath?, :has_css?, :has_no_css?,
    :check, :uncheck, :attach_file, :select, :source,
    :has_content?, :has_no_content?, :within, :within_fieldset, :within_table,
    :save_and_open_page, :find, :find_field, :find_link, :find_button,
    :field_labeled, :all, :locate, :evaluate_script,
    :click, :wait_until
  ]
  SESSION_METHODS.each do |method|
    class_eval <<-RUBY, __FILE__, __LINE__+1
      def #{method}(*args, &block)
        page.#{method}(*args, &block)
      end
    RUBY
  end

end
