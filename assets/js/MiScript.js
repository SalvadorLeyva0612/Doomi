//como buena practica, imprimir en consola para saber si la referencia se hizo corretamente
console.log("ejecutando MiScript.js");

var posible = false;
var esMayor = false;
var titulo, icono, msg;
var now = new Date(Date.now());

function ValidarFecha() {
    //no puedo reservar en una fecha menor a hoy 
    var mifecha = document.getElementById("contact_fecha");

    //validar la fecha
    var dia = now.getDate();
    var mes = now.getMonth() + 1
    var anio = now.getFullYear();

    dia = (dia < 10) ? "0" + dia : dia;
    mes = (mes < 10) ? "0" + mes : mes;

    var fechaFormated = anio + "-" + mes + "-" + dia;
    if (mifecha.value < fechaFormated) {
        //Sweet Alert
        icono = "warning";
        titulo = "Algo salió mal :(";
        msg = "La reservación no se puede ser menor al dia de hoy";
        posible = false;
    } else {
        esMayor = (mifecha.value > fechaFormated) ? true : false;
        posible = true;
    }

}
function validarHora() {
    var timecontrol = document.getElementById("contact_hora");
    var horas = now.getHours()+2;//recuperamos hora y minutos del servidor
    var minutos = now.getMinutes();
    var apertura = "08:00";
    var cerrar = "19:00";

    //validar formato de hora (validar 0)
    if (horas < 10) {
        horas = "0" + horas;
    }

    if (minutos < 10) {
        minutos = "0" + minutos;
    }
    //concatenar hora y minutos
    var formated = horas + ":" + minutos;
    console.log("Formated: " + formated);
    console.log("timecontrol.value: " + timecontrol.value)

    //valido que el dia sea mayor que el dia de hoy}
    if (esMayor) {
        //el dia es mayor que hoy valido solo apertura y cierre
        if (timecontrol.value < apertura && timecontrol.value < cierre) {
            posible = true;
        }

    } else {
        //la fecha seleccionada es hoy
        if (timecontrol.value)

        if (timecontrol.value < formated) {
            //Sweet Alert
            icono = "warning";
            titulo = "Upsi pupsi :(";
            msg = "Una reservacion debe tener 2 horas de antelación";
        }
        posible = (timecontrol.value < formated) ? false : true;
    }
}

function validarnombre() {
    var nombre = document.getElementById("contact_name");
    var valor = nombre.value;
    if (valor === '') {
        posible = false;
        icono = "warning";
        titulo = "Vacío";
        msg = "El nombre está vacío";

    } 

}

function validarcorreo() {
    var correo = document.getElementById("contact_email");
    var valor = correo.value;

    //Expresion regular para validad correo electronico
    var expresionRegularCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (valor === '') {
        posible = false;
        icono = "warning"
        titulo = "Vacio"
        msg = "el correo está vacío"

    } else if (!expresionRegularCorreo.test(valor)) {
        posible = false;
        icono = "info"
        titulo = "Formato"
        msg = "el correo no tiene el formato correcto"
    }


}

function Sumar() {
    var personas = document.getElementById("contact_people");
    var personasA = document.getElementById("contact_add");
    var total = document.getElementById("total");

    var a = parseInt(personas.value)
    var b = parseInt(personasA.value)

    if (a < 0 || b < 0) {
        posible = false;
        icono = "warning";
        titulo = "Oh shet";
        msg = "No se puede color numeros negativos";
        personas.value = 1;
        personasA.value = 0;
        a = 1;
        b = 0;

    }
        total.value = a + b
}

function validar() {
    var personas = document.getElementById('contact_people')
    var personas_add = document.getElementById('contact_add')
    var timeControl = document.getElementById("contact_hora");
    var mifecha = document.getElementById("contact_fecha")

    //el vento 'blur' se ejcuta una vez que el elemnto haya perdido el foco
    personas.addEventListener('blur', validar)
    personas_add.addEventListener('blur', validar)
    timeControl.addEventListener('blur', validarHora)
    mifecha.addEventListener('blur', ValidarFecha)

    var a = parseInt(personas.value)
    var b = parseInt(personas_add.value)

    if (a < 0 && b < 0 || a > 8 || b > 4 || a == "") {
        posible = false
        icono = "error"
        titulo = "Numero de personas inválida"
        msg = "La reservación solo permite minimo 1 persona y no debe exceder de 12 (8+4)"
        personas.value = 1
        personas_add.value = 0
        console.log("Numeros invalidos");
    } else {
        posible = true
    }

    Sumar()
    ValidarFecha()
    validarHora()
}

function enviarformulario() {
    validarnombre()
    validarcorreo()
    if (posible) {
        mostrar("success", "Listo", "Su reservacion fue realizada con éxito")
    } else {
        mostrar(icono, titulo, msg)
    }
}

function mostrar(icono, titulo, mensaje) {
    Swal.fire({
        title: titulo,
        text:   mensaje,
        icon:   icono
    });
}
//solucionar tema de doble 0

//google maps
function getGeo() {
    if (navigator && navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(geoOK,geoError)
    }
}

function geoOK(position) {
    console.log(position)
    showLatlong(position.coords.latitude, position.coords.longitude)
    initMap2(position.coords.latitude, position.coords.longitude)
}
function geoError(error) {
    if (error.code == 1) {
        console.log("El usuario negó el permiso")
        alert("El usuario negó el permiso")
    } else if (error.code == 2) {
        console.log("No se puede reuperar la ubicacion")
        alert("No se puede reuperar la ubicacion")
    } else if (error.code == 3) {
        console.log("Expiró el tiempo de respuesta")
        alert("Expiró el tiempo de respuesta")
    } else {
        console.log("Error: " + error.code)
        alert("Error: " + error.code)
    }
}

function showLatlong(lat,long) {
    var geocoder = new google.maps.Geocoder(); // esto servirá para serializar las coordenadas para el streetview
    var milocalizacion = new google.maps.LatLng(lat,long) // convierte mis coordenadas en el formato para el mapa de google
    console.log(milocalizacion)
    //Generamos la direccion
    geocoder.geocode({ 'latLng': milocalizacion }, processGeocoder);
}
  
function processGeocoder(result, status) {
    //imprimimos lo que estamos recibiendo en la funcion 
    console.log(result)
    console.log(status)
    if (status == google.maps.GeocoderStatus.OK) {
        //Esperamos los resultados de google para obtener una direccion real en lugar de solo coordenadas
        if (result[0]) {
            var direccion = result[0].formated_address
            //buscamos (usando JQuery) el elemento #direccion y colocamos la direccion que nos respondió google
            $("#direccion").html(direccion);
        } else {
            error("Google no retornó ningún resultado")
        }
    } else {
        error("Google marcó un error")
    }

}

let map;

async function initMap() {
    const { Map } = await google.maps.importLibrary("maps");
}

function initMap2(lat,lng) {
    //genero la informacion para obtener un mapa desde Google
    var miscoordenadas = new google.maps.LatLng(lat, lng)
    //configuro las opciones para mi mapa
    var mapoptions = {
        zoom: 15,
        center: miscoordenadas,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    //imprimo el mapa en pantalla 
    var map = new google.maps.Map(document.getElementById("map"), mapoptions)
    //configuro un marcador de posicion para mi mapa
    new google.maps.Marker({
        position: miscoordenadas,
        map,
        title: "Hello wolrd"
    });

    //con JQuery asigno un tamaño al espacio del streetview
    $("#street").css("height", 300);
    //creo y configuro el streetview
    var panorama = new google.maps.StreetViewPanorama(document.getElementById("street"),
        { position: miscoordenadas, pov: { heading: 90, pitch: 5 } })
    //muestro el streetview
    map.setStreetView(panorama)
    //recargo el mapa por ultima ocasión
    window.initMap = initMap

}