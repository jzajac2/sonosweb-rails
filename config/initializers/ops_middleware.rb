Rails.application.middleware.with_options :logger => Rails.logger do |m|
    m.use E20::Ops::Middleware::RevisionMiddleware
    m.use E20::Ops::Middleware::HostnameMiddleware
    m.use E20::Ops::Middleware::TransactionIdMiddleware
end
  