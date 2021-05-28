let a  = document.querySelector('.admin a');
let ul = document.querySelector('ul.buttons-admin')
let li = document.querySelectorAll('ul.buttons-admin>li');


a.onmouseenter = () =>{ 
    ul.style.display = "flex";
    ul.style.position = "absolute";

    li.forEach( ( e ) => { 
        e.className = 'enable';
    });
}

ul.addEventListener('mouseleave', () => {
    ul.style.display = 'none';
} )