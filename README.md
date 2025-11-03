# Taller Mecánico - Sistema Web en Django

Proyecto educativo desarrollado para un **taller mecánico**, como parte del curso de **Python y Django**.  
Basado en el sistema previo hecho con **Flet**, este proyecto traslada la lógica a un sitio web con **HTML, CSS, Bootstrap y Django Templates**.

---

## Objetivo del Proyecto

El objetivo principal es **aplicar conocimientos de frontend e integración de plantillas en Django**.  
Se busca lograr un sitio funcional, con estructura ordenada de archivos y un diseño responsive.

---

## Estructura del Proyecto

```bash
taller_mecanico/
├─ manage.py
├─ requirements.txt
├─ README.md
├─ taller_mecanico/
│   ├─ __init__.py
│   ├─ settings.py
│   ├─ urls.py
│   ├─ wsgi.py
│   └─ asgi.py
├─ core/
│   ├─ __init__.py
│   ├─ views.py
│   ├─ urls.py
│   ├─ apps.py
│   ├─ templates/
│   │    ├─ base.html
│   │    ├─ inicio.html
│   │    ├─ acerca.html
│   │    ├─ servicios.html
│   │    ├─ contacto.html
│   │    ├─ cotizacion.html
│   │    └─ login.html
│   └─ static/
│         ├─ css/
│         │    └─ style.css
│         ├─ js/
│         │    └─ main.js
│         ├─ img/
│         │    ├─ logo.png
│         │    ├─ taller.jpg
│         │    ├─ equipo.jpg
│         │    └─ mecanico.jpg
│         └─ logo/
│              └─ logo-small.png
└─ static/   # (opcional para recursos globales)
```

---

## Instalación y Ejecución

### Clonar el repositorio
```bash
git clone https://github.com/mateo-ulla/Programa-Taller-Mecanico.git
cd taller_mecanico
```

### Crear y activar un entorno virtual
Windows:
```bash
python -m venv venv
venv\Scripts\activate
```

Linux/Mac:
```bash
python3 -m venv venv
source venv/bin/activate
```

### Instalar dependencias
```bash
pip install -r requirements.txt
```

### Ejecutar el servidor de desarrollo
```bash
python manage.py runserver
```

El sitio estará disponible en:  
 http://127.0.0.1:8000/

---

## Páginas incluidas

| Página | URL | Acceso | Descripción |
|--------|-----|---------|--------------|
| Inicio | `/` | Público | Bienvenida, resumen de servicios |
| Acerca de Nosotros | `/acerca/` | Público | Historia, misión, equipo |
| Servicios | `/servicios/` | Público | Detalle de servicios |
| Contacto | `/contacto/` | Público | Formulario y ubicación |
| Cotización | `/cotizacion/` | Público | Solicitud de presupuesto |
| Login | `/login/` | Restringido | Acceso a empleados |
| Panel Admin | `/admin/` | Restringido | Panel administrativo de Django |

---

##  Tecnologías utilizadas

- **Python 3.12+**
- **Django 5**
- **HTML5 / CSS3 / Bootstrap 5**
- **JavaScript**
- **Git y GitHub**

---

##  Notas para el profesor

- El proyecto **no utiliza modelos ni migraciones**, solo vistas estáticas y formularios HTML.  
- Todo el **CSS está separado en `/static/css/style.css`**.  
- Se incluyen imágenes y un logo dentro de `/static/img/`.   