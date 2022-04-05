# rickandmorty

# ESTRUCTURA

- Repositorio: GitHub
- Metodologia: Git-flow - Uso de ramas.
- Estructura en Flutter - Getx (tres pilares fundamentales):
    - Binding
    - Controller
    - View
- Paquetes:
    - google_fonts: Para las fuentes y temas de la app.
    - Lazy_load: Carga de datos paginada.
    - shared_preferences: Guardar datos de forma local.
    - share_plus: Funcionalidad de compartir
      __[https://flutteracademy.app](Flutteracademy - web propia)__

# STEP BY STEP

## Paso 1

### Definir la estructura del proyecto

- Getx: Nos permite una estructura escalable y dinámica.

## Paso 2

### Importar los recursos de nuestro proyecto

- Importación de imagenes.
  - Exportar los recursos desde Figma.
  - Al no poderlos exportar definimos las imagenes de forma aleatoria.
- Importación de modelos en forma de json.
  - Para definir los json podemos usar la herramienta de Postman.

## Paso 3

### Definir las rutas de nuestro proyecto

- Definimos la Home como primera página.
- Definimos las rutas de los Personajes y Detalles del Personaje.

## Paso 4

### Definir el tema de nuestra aplicación

- Para mayor rapidez en el desarrollo aplicamos la fuente de "Montserrat" que proviene del paquete de Google Fonts. (Fuente principal en el diseño de Figma)

- Definimos los colores y los textos en theme/app_colors.dart y theme/app_fonts.dart

- Nota: Los tamaños y los colores se encuentran definidos tal y como se interpreta desde el diseño de Figma.

- Nota: Los iconos no han sido exportados y globalizados desde figma. Se utilizarán lo iconos proporcionados por Flutter.

## Paso 5

### Crear widgets globales

#### Background

- Creamos un widget con el background Image ya que va a ser reutilizado en nuestra app.

#### Botones

- Creamos el widget Button como widget global ya que va a ser reutilizado en nuestra app.
- Creamos el widget ButtonSearch como widget global.
- Creamos el widget PopupmenuButton como widget global.
- Creamos el widget FavouriteButton como widget global ya que va a ser reutilizado en nuestra app.

#### Cartas

- Creamos el widget de CardCharacter como widget global ya que va a ser reutilizado en nuestra app.
- Creamos el widget que agrupa los textos dentro de la CardCharacter ya que va a ser reutilizado dentro de la card.

## Paso 6

### Recibir datos de los personajes desde la API

- Crear el modelo "personaje".
- Crear el provider y controlador para recibir los datos desde la API.
- Recibir los datos en la pantalla correspondiente.

### Añadir mas datos incrementando la page de la API

- Creamos la función correspondiente en el controlador.
- Utilizamos el paquete lazyload para cargar mas datos en la pantalla incrementando la página.

## Paso 7

### Implementacion de Filtro: Buscar personaje

- Creamos el widget button search para realizar las búsquedas en función del nombre del personaje
- Creamos la función de búsqueda en el controlador
- Filtrar los datos en la pantalla en función de la búsqueda agregada a una lista de personajes

### Implementacion de Filtro: Genero y Status

- Creamos los widgets correspondientes para filtrar por categorias
- Creamos las funciones de búsqueda con el end point correspondiente en el controlador.
- Filtramos los datos en la pantalla en función de la categoría selecionada

#### NOTA: Cabe la posibilidad de que haya uno o mas filtros seleccionados

### Implementamos un dropdown

- En el dropdown se podrán limpiar todos los filtros.
- Implementamos las funciones para limpiar los filtros en el controlador.

## Paso 8

### Navegación a pantalla de Detalles

- Utilizamos Getx para la navegación entre pantallas

### Implementación pantalla de Detalles

- Implementamos el widget para la información del personaje correspondiente.
- Creamoes el modelo episodio.
- Implementamos el widget para los episodios del personaje correspondiente
- Implementamos el boton ver mas que incremente los episodios de 4 en 4 en caso de que la lista lo permita.

## Paso 9

### Creación de Personajes interesantes

- Implementamos una función random que devuelva 3 personajes aleatorios del endpoint correspondiente en el controlador.
- Implementamos el widget para los personajes interesantes dentro de la pagina de Detalles.

## Paso 10

### Creación de favoritos

- Crear una lista de personajes favoritos en el controlador con las funciones correspondientes.
- Manejar los favoritos de forma local con el paquete shared_preferences.
- Realizar el filtrado de los personajes también en si es o no favorito.

## Paso 11

- Agregar un boton para imprimir la lista de favoritos exclusivamente.

## Paso 12

### Creación de funcionalidad compartir

- Agragar paquete share_plus para compartir lo que deseemos.
- Se añade la funcionalidad al boton de compartir personaje.
- Lo que se compartira será el enlace a la web __[https://flutteracademy.app](flutteracademy)__ - (web propia)

# ASPECTOS A MEJORAR

## Nota: Dada la rapidez y los cortos plazos en los que se ha realizado la app se ha tratado de realizar la app con las mayores funcionalidades y con un esqueleto lo mas claro, escalable y dinámico posible dentro del límite de tiempo establecido.

- Se debería realizar una revisión del árbol de widget dentro de cada pantalla para ver si se puede globalizar mas parte del código.

- Se debería realizar una revisión de los widgets para ver si se pueden globalizar y reutilizar de forma mas óptima en nuestro código.

- Se debería dar uso de mas funcionalidades que mejorarían la claridad del código tales como:
  - Enum
  - swich - case

- Se deberían haber usado pruebas unitarias proporcionadas por Flutter para realizar las buenas prácticas establecidas

  - Web: __[https://esflutter.dev/docs/cookbook/testing/unit/introductions](pruebas unitarias)__