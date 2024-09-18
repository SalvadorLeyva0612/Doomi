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
		<title>Doomi</title>
	</head>

  <body>
  
    <!-- Start Header/Navigation -->
		<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

			<div class="container">
				<a class="navbar-brand" href="index.htmls">Dominica<span>.</span></a>

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

					<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
						<li><a class="nav-link" href="cart.html"><img src="assets/images/cart.svg"/></a></li>
					</ul>
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
							<xsl:call-template name="PlayRoom"></xsl:call-template>
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

				<div class="row">
					<div class="col-lg-8">
						<div class="subscription-form">
							<h3 class="d-flex align-items-center"><span class="me-1"><img src="images/envelope-outline.svg" alt="Image" class="img-fluid"/></span><span>Subscribe to Newsletter</span></h3>

							<form action="#" class="row g-3">
								<div class="col-auto">
									<input type="text" class="form-control" placeholder="Enter your name"/>
								</div>
								<div class="col-auto">
									<input type="email" class="form-control" placeholder="Enter your email"/>
								</div>
								<div class="col-auto">
									<button class="btn btn-primary">
										<span class="fa fa-paper-plane"></span>
									</button>
								</div>
							</form>

						</div>
					</div>
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
								<h1>Explorar Dominica <span clsas="d-block">checando nuestros productos</span></h1>
								<p class="mb-4">Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique.</p>
								<p><a href="" class="btn btn-secondary me-2">Shop Now</a><a href="#" class="btn btn-white-outline">Explore</a></p>
							</div>
						</div>
						<div class="col-lg-7">
							<div class="hero-img-wrap">
								<img src="assets/images/couch.png" class="img-fluid"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->
    
    <!-- Start Product Section -->
		<div class="product-section">
			<div class="container">
				<div class="row">
          
          
            <xsl:for-each select="Categoria/Prendas/Prenda[@Orden = 1]">
          
              	<!-- Start Column 1 -->
					<div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
						<a class="product-item" href="cart.html">
							<img src="{Imagen}" class="img-fluid product-thumbnail"/>
							<h3 >
                <xsl:value-of select="../@Tipo"/>
              </h3>
							<span class="icon-cross">
								<img src="assets/images/cross.svg" class="img-fluid"/>
							</span>
						</a>
					</div> 
          
            </xsl:for-each>
            
          
         
          
          
          
          
          
          
        
      
    
				</div>
			</div>
		</div>
		<!-- End Product Section -->

   
    
    
 
  	
  </xsl:template>
  
  <xsl:template name="Hombres">

    <h3> Hola desde hombres</h3>
  </xsl:template>

<xsl:template name="Mujeres">

    <h3> Hola desde mujeres</h3>
  </xsl:template>

<xsl:template name="Contact">

    <h3> Hola desde contact</h3>
  </xsl:template>
  
  <xsl:template name="PlayRoom">

    <h3> Hola desde playroom</h3>
  </xsl:template>
  
  

</xsl:stylesheet>
