# Script de Mantenimiento y Actualización de Ubuntu

Este script realiza tareas de mantenimiento y actualización en un sistema Ubuntu, incluyendo la limpieza de caché, la eliminación de kernels antiguos y la corrección de dependencias.

## Características

- Actualiza la lista de paquetes y el sistema.
- Corrige dependencias incumplidas.
- Elimina paquetes en desuso y archivos descargados.
- Limpia el menú de GRUB.
- Elimina paquetes de datos y bibliotecas innecesarias.
- Realiza limpieza de archivos de configuración antiguos y kernels obsoletos.
- Vacia las papeleras de reciclaje.

## Requisitos

- Sistema operativo Ubuntu.
- Privilegios de root (sudo).

## Uso

1. Clona este repositorio o descarga el script.
2. Otorga permisos de ejecución al script:

   ```bash
   chmod +x mantenimiento_ubuntu.sh
   ```

3. Ejecuta el script:

   ```bash
   sudo ./mantenimiento_ubuntu.sh
   ```

## Descripción del Script

### Variables Generales

- `usuario_del_equipo`: Detecta automáticamente el nombre del usuario actual del sistema.

### Función `Ubucleaner`

Realiza las siguientes tareas:

- Limpieza de caché de apt.
- Eliminación de archivos de configuración antiguos.
- Eliminación de kernels antiguos.
- Vaciado de todas las papeleras de reciclaje.

### Función `Main`

Realiza las siguientes tareas en orden:

1. Actualización de la lista de paquetes.
2. Actualización del sistema.
3. Comprobación y corrección de dependencias incumplidas.
4. Eliminación de paquetes en desuso.
5. Limpieza de archivos descargados y antiguos.
6. Limpieza del menú de GRUB.
7. Eliminación de paquetes de datos y bibliotecas innecesarias (en ciclos).
8. Llamada a la función `Ubucleaner` para tareas adicionales de limpieza.

## Contribución

Las contribuciones son bienvenidas. Por favor, abre un issue o envía un pull request para cualquier mejora o corrección.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
