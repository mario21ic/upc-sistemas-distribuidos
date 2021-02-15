module SessionsHelper

    def log_in(usuario)
     
        session[:usuario_id] =usuario.id 
        session[:usuario_correo_corporativo] = usuario.correo_corporativo
        session[:usuario_perfil] = usuario.perfil
        session[:usuario_nombre] = usuario.nombre

    end
    
    def current_usuario
    
        @current_user ||= Usuario.find_by(id: session[:usuario_id])
    end

    def logged_in?

        !current_usuario.nil?
    end

    def log_out

        session.delete(:usuario_id)
        session.delete(:usuario_nombre)
        session.delete(:usuario_perfil)
        session.delete(:usuario_correo_corporativo)
        @current_user = nil

    end




end
