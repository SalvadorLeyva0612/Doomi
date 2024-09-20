let contador = 0;

function agregarCarrito() {
    const elemProduct = getElementById("div-product")
    let producto = elemProduct.value
    localStorage.setItem('producto', producto)
    contador++;
    console.log("Agregando a localstorage: " + producto)

}