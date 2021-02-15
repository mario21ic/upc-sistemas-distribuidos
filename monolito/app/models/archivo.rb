class Archivo < ApplicationRecord
	mount_uploader :nombre_archivo, NombreArchivoUploader
end
