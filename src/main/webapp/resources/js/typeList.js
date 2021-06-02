'use strict';

function scrollIntoviews(selector){
    const scrollTo = document.querySelector(selector);
    scrollTo.scrollIntoView({behavior: "smooth"});
}

const home = document.querySelector('.product__wrapper');
const homeHeight = home.getBoundingClientRect().height;
const arrowUp = document.querySelector('.arrow-up');
	document.addEventListener('scroll', () =>{
	   if(window.scrollY > homeHeight) {
	    arrowUp.classList.add('visible');
	   } else{
	    arrowUp.classList.remove('visible');
	   }   
	});

arrowUp.addEventListener('click', ()=> {
    scrollIntoviews('#new');
});