from django.shortcuts import render, redirect
from django.contrib import messages

def inicio(request):
    """
    Página principal: hero, resumen de servicios, CTA
    """
    servicios = [
        {"titulo": "Cambio de aceite", "descripcion": "Cambio de aceite y filtro con marcas reconocidas."},
        {"titulo": "Frenos", "descripcion": "Revisión y reemplazo de pastillas, discos y calibración."},
        {"titulo": "Suspensión", "descripcion": "Reparación y ajuste de amortiguadores y resortes."},
        {"titulo": "Electricidad", "descripcion": "Diagnóstico y solución de fallas eléctricas."},
        {"titulo": "Alineación", "descripcion": "Alineación y balanceo para mayor vida útil de neumáticos."},
    ]
    return render(request, "inicio.html", {"servicios": servicios})

def acerca(request):
    """
    Página 'Quienes somos': misión, visión, historia y equipo
    """
    equipo = [
        {"nombre": "Mateo Ulla", "rol": "Jefe de taller"},
        {"nombre": "Matías Llanos", "rol": "Administración"},
        {"nombre": "Santino Macchiarola", "rol": "Técnico mecánico"},
        {"nombre": "Oriana Daer", "rol": "Secretaria"},
    ]
    contexto = {
        "mision": "Brindar soluciones automotrices confiables y accesibles.",
        "vision": "Ser el taller de referencia en la región por calidad y servicio.",
        "historia": "Fundado en 2010, crecemos gracias al boca a boca y trabajo serio.",
        "equipo": equipo,
    }
    return render(request, "acerca.html", contexto)

def servicios(request):
    """
    Página que lista todos los servicios (detalle)
    """
    lista_servicios = [
        {"titulo": "Mecánica general", "detalle": "Reparaciones de motor, caja, embrague y partes mecánicas."},
        {"titulo": "Repuestos", "detalle": "Suministro y montaje de repuestos originales y genéricos."},
        {"titulo": "Diagnóstico", "detalle": "Equipo de diagnóstico OBD-II para fallas complejas."},
        {"titulo": "Pre-ITV", "detalle": "Revisión previa para asegurar que el vehículo pase la verificación."},
        {"titulo": "Servicio rápido", "detalle": "Cambios de aceite y servicios en el día."},
    ]
    return render(request, "servicios.html", {"lista_servicios": lista_servicios})

def contacto(request):
    """
    Formulario de contacto — no persiste (por petición sin models), solo demo.
    """
    if request.method == "POST":
        nombre = request.POST.get("nombre")
        email = request.POST.get("email")
        mensaje = request.POST.get("mensaje")
        # Aquí normalmente guardaríamos o enviaríamos un email.
        # Para la entrega práctica, solo mostramos un mensaje de éxito.
        messages.success(request, f"Gracias {nombre}. Tu mensaje fue recibido.")
        return redirect("contacto")
    return render(request, "contacto.html")

def cotizacion(request):
    """
    Solicitud de presupuesto — interfaz solamente.
    """
    if request.method == "POST":
        nombre = request.POST.get("nombre")
        vehiculo = request.POST.get("vehiculo")
        servicio_solicitado = request.POST.get("servicio")
        telefono = request.POST.get("telefono")
        messages.success(request, "Solicitud enviada. Nos comunicaremos a la brevedad.")
        return redirect("cotizacion")
    servicios_form = ["Cambio de aceite", "Frenos", "Alineación", "Diagnóstico", "Repuestos"]
    return render(request, "cotizacion.html", {"servicios": servicios_form})

def login_empleados(request):
    """
    Interfaz de Inicio de Sesión (formulario). No implementamos lógica completa de autenticación
    para mantenerlo simple y acorde al trabajo práctico.
    """
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        # Aquí podrías autenticar con django.contrib.auth.authenticate y login
        # Pero como el TP pidió solo la interfaz, mostramos success si los campos llenos.
        if username and password:
            messages.success(request, f"Bienvenido, {username}. (Simulado)")
            return redirect("inicio")
        else:
            messages.error(request, "Debe completar usuario y contraseña.")
    return render(request, "login.html")
