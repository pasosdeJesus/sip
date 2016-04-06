class ActiveRecord::Base

  # Basado en soluciones de
  # http://stackoverflow.com/questions/6541209/decimals-and-commas-when-entering-a-number-into-a-ruby-on-rails-form 
  def self.flotante_localizado(*fields)
    fields.each do |f|
      define_method("#{f}_localizado") do
        val = read_attribute(f)
        val ? val.to_s.a_decimal_localizado : nil
      end
      define_method("#{f}_localizado=") do |e|
        write_attribute(f, e.to_s.a_decimal_nolocalizado)
      end
    end
  end

  def self.fecha_ddMyyyy(*fields)
    fields.each do |f|
      define_method("#{f}_ddMyyyy") do
        val = read_attribute(f)
        if !val
          return nil
        end
        val = val.to_s
        a = val[0, 4]
        m = val[5, 2]
        d = val[8, 2]
        meses = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 
               'Ago', 'Sep', 'Oct', 'Nov', 'Dic']
        return "#{d}/#{meses[m.to_i - 1]}/#{a}"
      end
      define_method("#{f}_ddMyyyy=") do |e|
        val = e.to_s
        a = val[7, 4]
        nomm = val[3, 3]
        d = val[0, 2]
        meses = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 
               'Ago', 'Sep', 'Oct', 'Nov', 'Dic']
        m = 1
        nm = meses.index(nomm)
        if nm
          m = 1 + meses.index(nomm)
        end
        write_attribute(f, "#{a}-#{m}-#{d}")
      end
    end

  end

end
