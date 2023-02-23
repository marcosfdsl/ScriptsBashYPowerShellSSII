if [ $# = 0 ]; then

	echo "No se ha especificado ningún número por parámetro. Ejecución: ./evaluable.sh <num>"
	echo "Escriba un número por parámetro del 1 al 3 según la opción deseada:"
	echo "1. Crea un directorio, un usuario y un grupo con permisos sobre el directorio y su contenido, copiando el programa en el directorio. Instala el jre de java si no está instalado. Al terminar la instalación muestra por pantalla un pequeño informe de las acciones realizadas."
	echo "2. Ejecución: muestra el contenido de un archivo en un color (R para rojo, G para verde y Y para amarillo) por pizarra.java. Ej: java pizarra.java archivo.txt R"
	echo "3. Desinstalación: deshace todo lo del punto 1. Al terminar la desinstalación muestra por pantalla un pequeño informe de las acciones realizadas."

elif [ $1 = "1" ]; then

	if [ ! -d "/ProgramaPizarra" ]; then

		sudo mkdir /ProgramaPizarra
		echo "Se ha creado el directorio /ProgramaPizarra correctamente."

	else

		echo "El directorio /ProgramaPizarra no se ha creado porque ya existe."

	fi

	sudo chown -R marcosfds /ProgramaPizarra
	sudo chmod -R 770 /ProgramaPizarra

	if [ -f "/ProgramaPizarra/pizarra.java" ]; then

		echo "La clase pizarra.java ya se encuentra en /ProgramaPizarra/."

	else

		sudo cp ~/Desktop/Evaluable/pizarra.java /ProgramaPizarra/
                echo "Se ha copiado la clase 'pizarra.java' al directorio /ProgramaPizarra/ correctamente."

	fi

	if id "UsuarioPizarra" &>/dev/null; then

		echo "El usuario 'UsuarioPizarra' no se ha creado porque ya existe."

	else

		sudo useradd -m UsuarioPizarra
		echo "Se ha creado el usuario 'UsuarioPizarra' correctamente."

	fi

	if getent group "GrupoPizarra" &>/dev/null; then

		echo "El grupo 'GrupoPizarra' no se ha creado porque ya existe."

	else

		sudo groupadd GrupoPizarra
		echo "Se ha creado el grupo 'GrupoPizarra' correctamente."

	fi

	sudo usermod -aG GrupoPizarra UsuarioPizarra
	sudo chown -R UsuarioPizarra /ProgramaPizarra
	sudo chown -R root:GrupoPizarra /ProgramaPizarra

	echo "Comprobando si está instalado JRE..."

	if ! command -v java &> /dev/null; then

		echo "Instalando JRE..."
		sudo apt update
		sudo apt install -y default-jre

		if [ $? -eq 0 ]; then

			echo "JRE se ha instalado correctamente."

		else

			echo "Ha ocurrido un error durante la instalación de JRE."

		fi

	else

		echo "JRE ya está instalado."

	fi

elif [ $1 = "2" ]; then

	echo "Introduce un fichero:"

	read fichero

	echo "Introduce un color (R para rojo, G para verde o Y para amarillo):"

	read color

	java pizarra.java $fichero $color

elif [ $1 = "3" ]; then

	echo "¿Está seguro de deshacer todo lo realizado? (Y/N)"

	read respuesta

		if [[ $respuesta == "Y" || $respuesta == "y" ]]; then

			if [ -d "/ProgramaPizarra" ]; then

				sudo rm -rf /ProgramaPizarra
				echo "Se ha eliminado el directorio /ProgramaPizarra correctamente."

			else

				echo "El directorio /ProgramaPizarra no ha sido eliminado porque no existe."

			fi

			if id "UsuarioPizarra" &>/dev/null; then

				sudo userdel UsuarioPizarra
				sudo rm -rf /home/UsuarioPizarra
				echo "Se ha eliminado el usuario 'UsuarioPizarra' correctamente."

			else

				echo "El usuario 'UsuarioPizarra' no ha sido eliminado porque no existe."

			fi

			if getent group "GrupoPizarra" &>/dev/null; then

				sudo groupdel GrupoPizarra
				echo "Se ha eliminado el grupo 'GrupoPizarra' correctamente."

			else

				echo "El grupo 'GrupoPizarra' no ha sido eliminado porque no existe."

			fi

		elif [[ $respuesta == "N" || $respuesta == "n" ]]; then

			echo "No se ha deshecho todo lo realizado."

		else

			echo "No se ha especificado una opción válida."

		fi

elif [ $1 = "ayuda" ]; then

	echo "Ejecución: ./evaluable.sh <num>"
	echo "Escriba un número por parámetro del 1 al 3 según la opción deseada:"
	echo "1. Instalación: crea un directorio, un usuario y un grupo con permisos sobre el directorio y su contenido, copiando el programa en el directorio. Instala el jre de java si no está instalado. Al terminar la instalación muestra por pantalla un pequeño informe de las acciones realizadas."
	echo "2. Ejecución: muestra el contenido de un archivo en un color (R para rojo, G para verde y Y para amarillo) por pizarra.java. Ej: java pizarra.java archivo.txt R"
	echo "3. Desinstalación: deshace todo lo del punto 1. Al terminar la desinstalación muestra por por pantalla un pequeño informe de las acciones realizadas."

else

	echo "No se ha especificado un número correcto."
        echo "Escriba un número por parámetro del 1 al 3 según la opción deseada:"
        echo "1. Instalación: crea un directorio, un usuario y un grupo con permisos sobre el directorio y su contenido, copiando el programa en el directorio. Instala el jre de java si no está instalado. Al terminar la instalación muestra por pantalla un pequeño informe de las acciones realizadas."
        echo "2. Ejecución: muestra el contenido de un archivo en un color (R para rojo, G para verde y Y para amarillo) por pizarra.java. Ej: java pizarra.java archivo.txt R"
        echo "3. Desinstalación: deshace todo lo del punto 1. Al terminar la desinstalación muestra por por pantalla un pequeño informe de las acciones realizadas."

fi
