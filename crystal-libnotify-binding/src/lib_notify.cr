@[Link("libnotify")]
lib LibNotify
  alias GInt = LibC::Int
  alias GBool = GInt
  alias GChar = LibC::Char

  type NotifyNotification = Void*

  fun notify_init(app_name : GChar*) : GBool
  fun notify_uninit : Void
  fun notify_notification_new(summary : GChar*, body : GChar*, icon : GChar*) : NotifyNotification*
  fun notify_notification_show(notification : NotifyNotification*, error : Void*) : GBool
end

module Transform
  class NotificationEmitter
    @@initialized = false

    def emit(summary : String, body : String) : Bool
      return false unless init
      notification = LibNotify.notify_notification_new(summary.to_unsafe, body.to_unsafe, nil)
      return false if notification.null?
      LibNotify.notify_notification_show(notification, nil) != 0
    end

    private def init : Bool
      return true if @@initialized
      return false unless LibNotify.notify_init("Transform") != 0
      @@initialized = true
      true
    end

    def self.shutdown : Nil
      if @@initialized
        LibNotify.notify_uninit
        @@initialized = false
      end
    end
  end
end
