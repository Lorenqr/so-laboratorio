# Taller de Simulación de Sistema de Archivos y Shell Gráfico Personalizado

## Introducción

Este repositorio contiene el desarrollo de dos talleres para el curso de Sistemas Operativos:

1. **Simulación de un sistema de archivos jerárquico** utilizando la terminal.
2. **Diseño de un shell gráfico personalizado** para el acceso rápido a herramientas básicas del sistema operativo.

---

## Parte 1: Simulación de un Sistema de Archivos Jerárquico

### Objetivos

- Comprender y simular el funcionamiento de un sistema de archivos jerárquico.
- Aplicar conceptos de organización y gestión de archivos desde la terminal.
- Explorar herramientas gráficas para la creación de entornos personalizados tipo shell.
- Fomentar la autonomía y el uso de herramientas colaborativas.

### Desarrollo

Se simuló un sistema de archivos que representa a tres usuarios ficticios, cada uno con su propio espacio de trabajo organizado en carpetas para documentos, imágenes y código.

#### Estructura

```
SISTEMA_ARCHIVOS/
├── carlos/
│   ├── documentos/
│   │   └── informe.txt
│   ├── imagenes/
│   │   └── foto.png
│   └── codigo/
│       └── codigo.py
├── juan/
│   ├── documentos/
│   │   └── informe.txt
│   ├── imagenes/
│   │   └── foto.png
│   └── codigo/
│       └── codigo.py
└── lorena/
    ├── documentos/
    │   └── informe.txt
    ├── imagenes/
    │   └── foto.png
    └── codigo/
        └── codigo.py
```

#### Instrucciones para la Simulación

1. **Creación de carpetas y archivos:**  
   Se utilizó PowerShell para crear la estructura con comandos como `New-Item -ItemType Directory` y `New-Item -ItemType File`.

2. **Visualización de la estructura de archivos:**
   Se utilizó el comando:
   ```powershell
   tree /F > estructura.txt
   ```
   Esto permitió generar un archivo `estructura.txt` con el árbol de directorios y archivos.

3. **Evidencias:**
   Se incluyeron capturas de pantalla mostrando:
   - La estructura del sistema de archivos desde la terminal.
   - El explorador de archivos de Windows con las carpetas y archivos creados.
   - El contenido de `estructura.txt` en un editor de texto.

4. **Repositorio en GitHub:**
   Todo el proyecto (carpetas, archivos y evidencias) fue subido y organizado en este repositorio.

5. **Video explicativo:**
   Se realizó un video de entre 5 y 10 minutos donde se muestra:
   - El funcionamiento y estructura de la simulación.
   - Una breve explicación de la organización y propósito del código y archivos generados.

---

## Parte 2: Desarrollo de un Shell Gráfico Personalizado

### Objetivos

- Diseñar un entorno gráfico minimalista que facilite el acceso a tres herramientas básicas: navegador web, editor de texto y terminal.
- El diseño debe ser funcional, intuitivo y atractivo visualmente.

### Desarrollo

**En proceso de desarrollo.**
Próximamente se incluirá aquí la información detallada sobre la creación e implementación del shell gráfico, incluyendo:

- Herramienta y lenguaje utilizados (por ejemplo, Python con Tkinter, PowerShell, etc.).
- Capturas de pantalla del diseño final y funcionamiento.
- Instrucciones para ejecutar el shell gráfico.
- Código fuente y explicación de la lógica utilizada.

#### Consideraciones iniciales

- Se investigarán opciones como Zenity, YAD, Tkinter, GTK (Linux), y PowerShell, AutoHotkey, Tkinter con Python (Windows).
- Se implementarán al menos tres botones o íconos para ejecutar: navegador, editor de texto y terminal.
- Se documentará el proceso de asociación de eventos de clic para abrir los programas del sistema.

---

## Evidencias de Entrega

- Carpeta y archivos generados para la simulación del sistema de archivos.
- Archivo `estructura.txt` con el árbol de directorios.
- Capturas de pantalla de la estructura y evidencias.
- Archivos fuente del shell gráfico (cuando esté terminado).
- Video explicativo mostrando los dos desarrollos.

---

## Autor

- [Lorenqr](https://github.com/Lorenqr)

---

## Notas

- Este README será actualizado con la información completa del segundo taller una vez finalizado el desarrollo del shell gráfico.