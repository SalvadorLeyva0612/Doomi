const king=document.querySelector(".chess-piece")
const squares= document.querySelectorAll(".square")
const inforDisplay = document-querySelector("#info")


king.addEventListener("drag",dragging)
king.addEventListener("dragstart",dragstart)

squares.forEach(square => {
    square.addEventListener("dragover",dragOver)
    square.addEventListener("dragenter",dragEnter)
    square.addEventListener("dragleave",dragLeave)
    square.addEventListener("dragdrop",dragDrop)
    square.addEventListener("dragend",dragEnd)

})

let beingDragged

function dragstart(){
    beingDragged = e.target
    console.log("dragging has started on " + beingDragged)
}


function dragging(){
    console.log(e.target + "is being dragged")
}


function dragOver(e){
    e.preventDefault()

}
function  dragEnter(e){
    console.log("Piece is entering")
    e.target.classList.add("highlight")

}

function dragLeave (e){
    console.log("Piece is leaving")
    e.target.classList.remove("highlight")
}

function dragDrop(e){
    e.target.append()
    e.target.classList.remove("highlight")

}

function dragEnd (e){

}

