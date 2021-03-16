const a  = document.querySelector('.admin a');
const ul = document.querySelector('ul.buttons-admin')
const li = document.querySelectorAll('ul.buttons-admin>li');


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