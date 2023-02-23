param(
    [Parameter(Mandatory=$true)]
    [string]$valor
)

if ($valor -eq "1") {
    Write-Output "La opción 1 no está disponible en esta actividad."
}
elseif ($valor -eq "2") {
    $fichero = Read-Host "Introduce un fichero"
    $color = Read-Host "Introduce un color (R para rojo, G para verde y Y para amarillo)"
    java pizarra.java $fichero $color
}
elseif ($valor -eq "3") {
    Write-Output "La opción 3 no está disponible en esta actividad."
}
else {
    Write-Output "No se ha especificado una opción válida por parámetro. Ejecución: ./evaluable.sh <num>"
	Write-Output "Escriba un número por parámetro del 1 al 3 según la opción deseada:"
	Write-Output "1. Crea un directorio, un usuario y un grupo con permisos sobre el directorio y su contenido, copiando el programa en el directorio. Instala el jre de java si no está instalado. Al terminar la instalación muestra por pantalla un pequeño informe de las acciones realizadas."
	Write-Output "2. Ejecución: muestra el contenido de un archivo en un color (R para rojo, G para verde y Y para amarillo) por pizarra.java. Ej: java pizarra.java archivo.txt R"
	Write-Output "3. Desinstalación: deshace todo lo del punto 1. Al terminar la desinstalación muestra por pantalla un pequeño informe de las acciones realizadas."
}