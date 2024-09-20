<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>
  
    <xsl:param name="TipoMenu" select="TipoMenu"></xsl:param>
    <xsl:template match="Dominica">
      <xsl:value-of select="Opciones/Opcion/@Url"/>
      
<html lang="en">
  <head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <meta name="author" content="Untree.co"/>
  <link rel="shortcut icon" href="assets/images/favicon.png"/>

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />

		<!-- Bootstrap CSS -->
		<link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"/>
		<link href="assets/css/tiny-slider.css" rel="stylesheet"/>
		<link href="assets/css/style.css" rel="stylesheet"/>
    <!--Sweet Alert-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     
   
    
		<title>Doomi</title>
	</head>

  <body>
  
    <!-- Start Header/Navigation -->
		<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

			<div class="container">
				<a class="navbar-brand" href="Default.aspx?Id=0">Dominica<span>.</span></a>

				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarsFurni">
					<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
						 <xsl:for-each select="Opciones/Opcion">
                  <li>
                    <!--xsl.choose funciona como Switch permitiendome crear casos que empaten en funcion de una condicion
										y declarar una condicion default-->
                    <xsl:choose>
                      <!--xsl.when es equivalente a los case del switch-->
                      <xsl:when test ="$TipoMenu = @Id">
                        <!--el uso del "@" hace referencia a un atributo del nodo en cuestion-->
                        <a class="nav-link scrollto active" href="{@Url}">
                          <xsl:value-of select="@Texto"/>
                        </a>
                      </xsl:when>
                      <!--xsl:otherwise es equivalente al "default" del switch-->
                      <xsl:otherwise>
                        <a class="nav-link scrollto " href="{@Url}">
                          <xsl:value-of select="@Texto"/>
                        </a>
                      </xsl:otherwise>
                    </xsl:choose>
                  </li>
                </xsl:for-each>
					</ul>

					<!--<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
						<li><a class="nav-link" href="cart.html"><img src="assets/images/cart.svg"/></a></li>
					</ul>-->
				</div>
			</div>
				
		</nav>
		<!-- End Header/Navigation -->
    
      <!--choose section-->
     <xsl:choose>
          <xsl:when test="$TipoMenu = 0">
            <!--"xsl:call-template" me ayuda a ivocar un template que contien informacion o estructurar dentro del msmo y asi interir dentro del template principal-->
            <xsl:call-template name="Home"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$TipoMenu = 1">
            <xsl:call-template name="Hombres"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$TipoMenu = 2">
            <xsl:call-template name="Mujeres"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$TipoMenu = 3">
            <xsl:call-template name="Contact"></xsl:call-template>
          </xsl:when>
				 <xsl:when test="$TipoMenu = 4">
							<xsl:call-template name="Blog"></xsl:call-template>
						</xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="Home"></xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
			<!--End of choose section-->
    
  	<!-- Start Footer Section -->
		<footer class="footer-section">
			<div class="container relative">

				<div class="sofa-img">
					<!--<img src="assets/images/sofa.png" alt="Image" class="img-fluid"/>-->
				</div>

			

				<div class="row g-5 mb-5">
					<div class="col-lg-4">
						<div class="mb-4 footer-logo-wrap"><a href="#" class="footer-logo">Furni<span>.</span></a></div>
						<p class="mb-4">Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant</p>

						<ul class="list-unstyled custom-social">
							<li><a href="#"><span class="fa fa-brands fa-facebook-f"></span></a></li>
							<li><a href="#"><span class="fa fa-brands fa-twitter"></span></a></li>
							<li><a href="#"><span class="fa fa-brands fa-instagram"></span></a></li>
							<li><a href="#"><span class="fa fa-brands fa-linkedin"></span></a></li>
						</ul>
					</div>

					<div class="col-lg-8">
						<div class="row links-wrap">
							<div class="col-6 col-sm-6 col-md-3">
								<ul class="list-unstyled">
									<li><a href="#">About us</a></li>
									<li><a href="#">Services</a></li>
									<li><a href="#">Blog</a></li>
									<li><a href="#">Contact us</a></li>
								</ul>
							</div>

							<div class="col-6 col-sm-6 col-md-3">
								<ul class="list-unstyled">
									<li><a href="#">Support</a></li>
									<li><a href="#">Knowledge base</a></li>
									<li><a href="#">Live chat</a></li>
								</ul>
							</div>

							<div class="col-6 col-sm-6 col-md-3">
								<ul class="list-unstyled">
									<li><a href="#">Jobs</a></li>
									<li><a href="#">Our team</a></li>
									<li><a href="#">Leadership</a></li>
									<li><a href="#">Privacy Policy</a></li>
								</ul>
							</div>

							<div class="col-6 col-sm-6 col-md-3">
								<ul class="list-unstyled">
									<li><a href="#">Nordic Chair</a></li>
									<li><a href="#">Kruzo Aero</a></li>
									<li><a href="#">Ergonomic Chair</a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>

				<div class="border-top copyright">
					<div class="row pt-4">
						<div class="col-lg-6">
					
           
						</div>

						<div class="col-lg-6 text-center text-lg-end">
							<ul class="list-unstyled d-inline-flex ms-auto">
								<li class="me-4"><a href="#">Terms &amp; Conditions</a></li>
								<li><a href="#">Privacy Policy</a></li>
							</ul>
						</div>

					</div>
				</div>

			</div>
		</footer>
		<!-- End Footer Section -->	


		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/tiny-slider.js"></script>
		<script src="js/custom.js"></script>
  

   
        
    
  
  
    
 
 </body>

</html>
</xsl:template>

  <xsl:template name="Home">

    <!-- Start Hero Section -->
    <div class="hero">
      <div class="container">
        <div class="row justify-content-between">
          <div class="col-lg-5">
            <div class="intro-excerpt">
              <h1>
                Explorar Dominica <span clsas="d-block">checando nuestros productos</span>
              </h1>
              <p class="mb-4">Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique.</p>
              <p>
                <a href="" class="btn btn-secondary me-2">Shop Now</a>
                <a href="" class="btn btn-white-outline">Explore</a>
              </p>
            </div>
          </div>
          <div class="col-lg-7">
            <div class="hero-img-wrap">
              <img src="assets/images/modelos.png" class="img-fluid"/>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- End Hero Section -->


    <!-- ======= Catalog Section ======= -->

    <div class="untree_co-section product-section before-footer-section">
      <div class="container">
        <div class="row">

          <div class="section-title">
            <h2>Catálogo</h2>
            <p>Descubres nuestros procutos</p>
          </div>

            <xsl:for-each select="Categoria/Prendas/Prenda">
          <div class="col-12 col-md-4 col-lg-3 mb-5">
              <a class="product-item" href="#">
                <img src="{Imagen}" class="img-fluid product-thumbnail"/>
                <h3 class="product-title">
                  <xsl:value-of select="@Nombre"/>
                </h3>
                <strong class="product-price">
                  <xsl:value-of select="Precio"/>
                </strong>

                <span class="icon-cross">
                  <img src="assets/images/cross.svg" class="img-fluid"/>
                </span>
              </a>
          </div>
            </xsl:for-each>            


        </div>
      </div>
    </div>
    
    

    <!-- End Catalog Section -->


  </xsl:template>
  
  <xsl:template name="Hombres">



    <div class="untree_co-section product-section before-footer-section">
		    <div class="container">
		      	<div class="row">
             <xsl:for-each select="Categoria[@Clase = 1]/Prendas/Prenda">
              
             <!-- Start Column 1 -->
					<div class="col-12 col-md-4 col-lg-3 mb-5" id="productHombres">
						<a class="product-item" href="#">
							<img src="{Imagen}" class="img-fluid product-thumbnail"/>
							<h3 class="product-title">
                <xsl:value-of select="@Nombre"/>
                
              </h3>
							<strong class="product-price">
                <xsl:value-of select="Precio"/>
              </strong>

							<span class="icon-cross">
								<img src="assets/images/cross.svg" class="img-fluid" id="btnagregar" />
							</span>
						</a>
					</div> 
					<!-- End Column 1 -->	 
             
              </xsl:for-each>
              
            		
						
						</div>
      </div>
    </div>

		      
  </xsl:template>

<xsl:template name="Mujeres">

     <div class="untree_co-section product-section before-footer-section">
		    <div class="container">
		      	<div class="row">
             <xsl:for-each select="Categoria[@Clase = 2]/Prendas/Prenda">
              
             <!-- Start Column 1 -->
					<div class="col-12 col-md-4 col-lg-3 mb-5" id="productMujeres">
						<a class="product-item" href="#">
							<img src="{Imagen}" class="img-fluid product-thumbnail"/>
							<h3 class="product-title">
                <xsl:value-of select="@Nombre"/>
                
              </h3>
							<strong class="product-price">
                <xsl:value-of select="Precio"/>
              </strong>

							<span class="icon-cross">
								<img src="assets/images/cross.svg" class="img-fluid" id="btnagregar"/>
							</span>
						</a>
					</div> 
					<!-- End Column 1 -->	 
             
              </xsl:for-each>
              			
						</div>
      </div>
    </div>
  </xsl:template>

<xsl:template name="Contact">

  
  <script type="text/javascript" src="assets/js/jquery-1.11.2.min.js"></script>
   <!-- ================ contact section start ================= -->
  
  <script>
    // $=> uso de Jquery
    // (document) => hace referenca al objeto que deseo obtener y/o manipular
    // .ready() => evento que se dispara una vez que el dom ha sido cargada
    // function() {} => es una funcion anonima

    $(document).ready(function(){
    console.log("Hola desde el script usando Jquery");

    //recuperar la fecha actual del servidor donde se ejecuta el sistema
    var now = new Date(Date.now());
    //recuperar el control de "contact_hora"
    var timeControl = document.getElementById("contact_hora");
    //recupero la hora y los minutos actuales del servidor
    var horas = now.getHours();
    var minutos = now.getMinutes();

    //imprimo en la onsola los resultados
    console.log("La hora actual es: " + horas + ":" + minutos);
    console.log("horas " + horas);
    console.log("minutos " + minutos);
    console.log("timeControl: ");
    console.log(timeControl);

    //validar formato de hora (validar 0)
    if (horas <![CDATA[<]]>  10){
    horas = "0" + horas;
    }

    if (minutos <![CDATA[<]]>  10){
    minutos = "0" + minutos;
    }
    //concatenar hora y minutos
    var formated = horas + ":" + minutos;
    console.log("Formated: " + formated);

    $("#contact_hora").attr("value",formated);

    var dia = now.getDate();
    var mes = now.getMonth() + 1;
    var anio = now.getFullYear();

    mes = mes <![CDATA[<]]> 10 ? "0" + mes : mes;
    dia = dia <![CDATA[<]]> 10 ? "0" + dia : dia;

    var fechaformated = anio + "-" + mes + "-" + dia;
    console.log("fecha formated: " + fechaformated);
    $("#contact_fecha").attr("value",fechaformated);

    initMap();
    getGeo()

    });

    //Validaciones
    var personas = document.getElementById('contact_people')
    var personasadd = document.getElementById('contact_add')

    personas.value = 1
    personasadd.value = 0

    validar()

  </script>
  
  <script>
      <![CDATA[
			(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
			key: "AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs",
			// Add other bootstrap parameters as needed, using camel case.
			// Use the 'v' parameter to indicate the version to load (alpha, beta, weekly, etc.)
			});]]>
    </script>
    
    <!--//Referencia a MiScript.js-->
    <script src="assets/js/MiScript.js" type ="text/javascript"> </script>
   
     <div data-aos="fade-up">
        <!--mapa-->
     
        <style>
          #map{
          border : 0;
          width: 100%;
          height: 350px;
          }
        </style>

        <div id="google-map">
          <div id="map"></div>
        </div>
        <text id="direccion"> esta es una etiqueta de texto</text>
        <div class="col-lg-12 margin-bottom-30" id="street"></div>
      </div>
  
  
         
        
  <!-- Start Contact Form -->
  <script src="assets/js/scriptForm.js"></script>
  <script>
    console.log(localStorage.getItem('nombre','apellido','correo','mensaje'))

  </script>
  <div class="untree_co-section">
      <div class="container">

        <div class="block">
          <div class="row justify-content-center">


            <div class="col-md-8 col-lg-8 pb-4">


              <div class="row mb-5">
                <div class="col-lg-4">
                  <div  class="service no-shadow align-items-center link horizontal d-flex active" data-aos="fade-left" data-aos-delay="0">
                    <div class="service-icon color-1 mb-4">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                        <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                      </svg>
                    </div> <!-- /.icon -->
                    <div class="service-contents">
                      <p><xsl:value-of select="Datos/Direccion"/></p>
                    </div> <!-- /.service-contents-->
                  </div> <!-- /.service -->
                </div>

                <div class="col-lg-4">
                  <div  class="service no-shadow align-items-center link horizontal d-flex active" data-aos="fade-left" data-aos-delay="0">
                    <div class="service-icon color-1 mb-4">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                        <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
                      </svg>
                    </div> <!-- /.icon -->
                    <div class="service-contents">
                      <a href ="mailto:{Datos/correo}">
                      <p> <xsl:value-of select="Datos/correo"></xsl:value-of> </p>
                   </a>
                    </div> <!-- /.service-contents-->
                  </div> <!-- /.service -->
                </div>

                <div class="col-lg-4">
                  <div  class="service no-shadow align-items-center link horizontal d-flex active" data-aos="fade-left" data-aos-delay="0">
                    <div class="service-icon color-1 mb-4">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                      </svg>
                    </div> <!-- /.icon -->
                    <div class="service-contents">
                      <p>+1 294 3925 3939</p>
                    </div> <!-- /.service-contents-->
                  </div> <!-- /.service -->
                </div>
              </div>

              <form>
                <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="text-black" for="fname">First name</label>
                      <input type="text" class="form-control" id="fname"/>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="text-black" for="lname">Last name</label>
                      <input type="text" class="form-control" id="lname"/>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="text-black" for="email">Email address</label>
                  <input type="email" class="form-control" id="email"/>
                </div>

                <div class="form-group mb-5">
                  <label class="text-black" for="message">Message</label>
                  <textarea name="" class="form-control" id="message" cols="30" rows="5"></textarea>
                </div>

                <button type="submit" class="btn btn-primary-hover-outline" onclick ="getForm()">Send Message</button>
              </form>
                            
            </div>

          </div>

        </div>

      </div>


    </div>
  <!--End of contact form-->
  
  <!--Comments section-->

  <div class ="comments-section">
    
    
  </div>
  
  
  
  
  <!--end of comments section-->

  
  
  
    <!-- ================ contact section end ================= -->
    


   
  </xsl:template>
  
  <xsl:template name="Blog">
    
   <!-- Start Blog Section -->
		<div class="blog-section">
			<div class="container">
				<div class="row mb-5">
					<div class="col-md-6">
						<h2 class="section-title">Recent Blog</h2>
					</div>
					<div class="col-md-6 text-start text-md-end">
						<a href="#" class="more">View All Posts</a>
					</div>
				</div>

				<div class="row">

					<div class="col-12 col-sm-4 col-md-4 mb-4 mb-md-0">
						<div class="post-entry" style="width:100%">
							<a href="#" class="post-thumbnail">
                <video controls="true" style="width:100%">
                  <source src ="assets/video/video.mp4"></source>
                </video>
                </a>
							<div class="post-content-entry">
								<h3><a href="#">First Time Home Owner Ideas</a></h3>
								<div class="meta">
									<span>by <a href="#">Kristin Watson</a></span> <span>on <a href="#">Dec 19, 2021</a></span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-12 col-sm-4 col-md-4 mb-4 mb-md-0">
						<div class="post-entry" style="width:100%">
             <iframe style="border-radius:12px"
              src="{spotify}"
              width="100%" 
              height="152"
              frameBorder="0" 
              allowfullscreen="" 
              allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" 
              loading="lazy"></iframe>
							<div class="post-content-entry">
								<h3><a href="#">First Time Home Owner Ideas</a></h3>
								<div class="meta">
									<span>by <a href="#">Kristin Watson</a></span> <span>on <a href="#">Dec 19, 2021</a></span>
								</div>
							</div>
						</div>
					</div>

				<div class="col-12 col-sm-4 col-md-4 mb-4 mb-md-0">
						<div class="post-entry" style="width:100%">
							<a href="#" class="post-thumbnail">
                <video controls="true" style="width:100%">
                  <source src ="assets/video/video.mp4"></source>
                </video>
                </a>
							<div class="post-content-entry">
								<h3><a href="#">First Time Home Owner Ideas</a></h3>
								<div class="meta">
									<span>by <a href="#">Kristin Watson</a></span> <span>on <a href="#">Dec 19, 2021</a></span>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- End Blog Section -->	 

   
  
  
  
  </xsl:template>
  
  

</xsl:stylesheet>
