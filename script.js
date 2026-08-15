const toggle = document.querySelector('.menu-toggle');
const nav = document.querySelector('.nav-links');

if (toggle && nav) {
  toggle.addEventListener('click', () => {
    const isOpen = nav.classList.toggle('open');
    toggle.setAttribute('aria-expanded', String(isOpen));
  });

  nav.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', () => {
      nav.classList.remove('open');
      toggle.setAttribute('aria-expanded', 'false');
    });
  });
}

const year = document.getElementById('year');
if (year) year.textContent = new Date().getFullYear();

const observer = new IntersectionObserver(
  entries => entries.forEach(entry => {
    if (entry.isIntersecting) entry.target.classList.add('reveal-in');
  }),
  { threshold: 0.12 }
);

document.querySelectorAll('.project-card, .spotlight-card, .about-grid, .vision-banner')
  .forEach(el => {
    el.classList.add('reveal-ready');
    observer.observe(el);
  });

const style = document.createElement('style');
style.textContent = `
  .reveal-ready { opacity: 0; transform: translateY(18px); transition: opacity .65s ease, transform .65s ease; }
  .reveal-ready.reveal-in { opacity: 1; transform: translateY(0); }
`;
document.head.appendChild(style);
