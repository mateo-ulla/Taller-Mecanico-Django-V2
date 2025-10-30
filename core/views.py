from django.shortcuts import render

def inicio(request):
    return render(request, 'inicio.html')

def acerca(request):
    return render(request, 'acerca.html')

def servicios(request):
    return render(request, 'servicios.html')

def contacto(request):
    return render(request, 'contacto.html')

def cotizacion(request):
    return render(request, 'cotizacion.html')

def login(request):
    return render(request, 'login.html')