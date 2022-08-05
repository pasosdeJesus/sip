class SolicitudMailer < ApplicationMailer
  

  def solicitud
    if !ENV['SMTP_MAQ']
      puts "No esta definida variable de ambiente SMTP_MAQ"
      exit 1
    end
    puts "OJO solicitud"
    @objeto = params[:objeto]
    puts "OJO objeto=#{@objeto}"
    @id = params[:id]
    puts "OJO id=#{@id}"
    @solicitante = params[:solicitante]
    puts "OJO solicitante=#{@solicitante}"
    @cor_solicitante = params[:cor_solicitante]
    puts "OJO cor_solicitante=#{@cor_solicitante}"
    @solicitado_a = params[:solicitado_a]
    puts "OJO solicitado_a=#{@solicitado_a}"
    @cor_solicitado_a = params[:cor_solicitado_a]
    puts "OJO cor_solicitado_a=#{@cor_solicitado_a}"
    @solicitud = params[:solicitud]
    puts "OJO solicitud=#{@solicitud}"
    @para = @cor_solicitado_a.select {|c| !(c =~ /@localhost$/)}
    puts "enviando con tema #{@que} a #{@para.count} receptores"
    mail(to: @para, 
         cc: 'vtamara@pasosdeJesus.org',
         subject: "[SI-JRSCOL] Solicitud del usuario #{@solicitante}")

  end

end
