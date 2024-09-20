
var Name, LstName, Email,Msg; 

function getForm(){

    Name = document.getElementById("fname");
    LstName = document.getElementById("lname");
    Email = document.getElementById("email");
    Msg = document.getElementById("message"),
       
    console.log(Name.value , LstName.value , Email.value , Msg.value)
    if(Name.value == null || LstName.value == null || Email.value == null || Msg.value == null ){
        console.log("usando if")
        mostrar("Error" , "Upsi" , "No pueden existir campos vacíos")
    }
    else{
        
         mostrar("success" , "Listo" , "Sus comentarios fueron agregados exitosamente");
        enviarLocal()
        mostrarComentarios()
    }     
}


function mostrar(icono, titulo, mensaje) {
    Swal.fire({
        title: titulo,
       text:   mensaje,
       icon:   icono
         });

        }

        function enviarLocal(){
            console.log("usando localStorage");
            localStorage.setItem('nombre',Name.value)
            localStorage.setItem('apellido',LstName.value)
            localStorage.setItem('correo',Email.value)
            localStorage.setItem('mensaje',Msg.value)
            console.log("agregado");
                }

function mostrarComentarios(){
    console.log("mostrando datos de localStorage");
            localStorage.getItem('nombre')
            localStorage.getItem('apellido')
            localStorage.getItem('correo')
            localStorage.getItem('mensaje')
            console.log(localStorage.getItem('nombre','apellido','correo','mensaje'))
            





            
    }

