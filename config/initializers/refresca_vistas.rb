
Rails.application.reloader.to_prepare do
  Sip::Mundep.refresca()
end

