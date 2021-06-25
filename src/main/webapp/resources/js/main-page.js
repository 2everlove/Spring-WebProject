'use strict';
const navbarMenu = document.querySelector('.navbar__menu-right');
navbarMenu.addEventListener('click', (event)=>{
    const target = event.target;
    const link = target.dataset.link;
    if(link == null){
        return;
    } 
    navbarMenu.classList.remove('active')
    scrollIntoviews(link);
});

const sectionIds = ['#new', '#sale', '#event'];
const sections = sectionIds.map(id => document.querySelector(id));
let navItems = sectionIds.map(id => document.querySelector('[data-link="'+id+'"]'));

let selectedNavIndex = 0;
let selectedNavItem = navItems[0];
function selectNavItem(selected){
    selectedNavItem.classList.remove('active');
    selectedNavItem = selected
    selectedNavItem.classList.add('active');
}
function scrollIntoviews(selector){
    const scrollTo = document.querySelector(selector);
    scrollTo.scrollIntoView({behavior: "smooth"});
    selectNavItem(navItems[sectionIds.indexOf(selector)]);
}

const oberverOption ={
	    root: null, rootMargin:'0px', threshold: 0.4,
	    // 뷰포트   루트마진            들어오는 비율

	};
const observerCallback = (entries, oberver) =>{
    entries.forEach(entry =>{
        // console.log(entry.target);
        if(!entry.isIntersecting && entry.intersectionRatio > 0){
            // console.log(entry);
            const index = sectionIds.indexOf(`#${entry.target.id}`);
            // console.log(index, entry.target.id);

            // 스크롤링이 아래로 되어서 페이지가 올라옴
            if(entry.boundingClientRect.y < 0){
                selectedNavIndex = index + 1;
            } else {
                selectedNavIndex = index - 1;
            }
        }
    });
};

const observer = new IntersectionObserver(observerCallback, oberverOption);
sections.forEach(section => observer.observe(section));

window.addEventListener('scroll', () => {
    if(window.scrollY === 0){
        selectedNavIndex = 0;
    } else if (Math.round(window.scrollY + window.innerHeight) === document.body.clientHeight){
        selectedNavIndex = navItems.length - 1;
    }
    selectNavItem(navItems[selectedNavIndex]);
})

// console.log(sections);
// console.log(navItems);


const home = document.querySelector('.new__product');
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