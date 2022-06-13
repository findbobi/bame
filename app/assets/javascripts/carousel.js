var carouselData = [
  {
    id:0,
    user: {
      name: 'Camila Silveira',
      age: 29,
      nationality: 'Brazilian',
      avatarImg: 'user1.jpg'
    },
    testimony: 'After Findbobi my relation with the healthy system changed',
    business: {
      name: 'Dr. Cordes',
      icon: 'icon.svg',
      description: 'Focus on infectious diseases and many years of experience in the treatment of hepatitis and more.',
      link: '/elitemedia.services'
    }
  },
  {
    id:0,
    user: {
      name: 'John Doe',
      age: 34,
      nationality: 'Mexican',
      avatarImg: 'user2.jpeg'
    },
    testimony: 'Finally a Dentist i can trust',
    business: {
      name: 'Dr. Cordes',
      icon: 'icon.svg',
      description: 'Focus on infectious diseases and many years of experience in the treatment of hepatitis and more.',
      link: '/elitemedia.services'
    }
  },
  {
    id:1,
    user: {
      name: 'Valerie Sam Sing',
      age: 22,
      nationality: 'Korean',
      avatarImg: 'salons.jpeg'
    },
    testimony: 'Lorem ipsum dollar',
    business: {
      name: 'Dr. Cordes',
      icon: 'icon.svg',
      description: 'Focus on infectious diseases and many years of experience in the treatment of hepatitis and more.',
      link: '/elitemedia.services'
    }
  },
]

var setTestimonies = ( testimonies ) => {
  const testimonyViewport = document.querySelector('.carousel__viewport');
  if( testimonyViewport !== null ) {
    for (testimony in testimonies){
      const data = testimonies[testimony]
      const bgImg = data.user.avatarImg// '<%= image_url(${data.user.avatarImg}) %>'
      const business = data.business
      testimonyViewport.innerHTML += `
      <li id="carousel__slide${data.id}"
          tabindex=${data.id}
          class="carousel__slide">
        <div class="testimonialPic" style="width:60%; height:45em; background-image:url('assets/${bgImg}')"></div>
          <div class="testimonialStatements">
            <h1>‘‘${data.testimony}’’</h1>
            <p>${data.user.name}, ${data.user.age} ${data.user.nationality}</p>
          </div>
          <div class="testimonialComment">
            <img class="businessIcon" src="assets/${business.icon}" alt="${business.name}">
            <div class="business-description">
            <div class="business-name">${business.name}</div>  
            ${business.description}
            </div>
          </div>
          <div class="carousel__snapper"></div>
      </li>
      `
      document.querySelector('.carousel__navigation-list').innerHTML += `
      <li class="carousel__navigation-item">
        <a href="#carousel__slide${testimony}" class="carousel__navigation-button">Go to slide ${testimony}</a>
      </li>
      `
  
    }
  
    document.querySelector('.carousel__navigation-list').innerHTML += `
    <li class="carousel__navigation-item">
      <a href="#carousel__slide${0}" class="carousel__prev">
        <img src="assets/prev.svg" class="slider-icon" alt="<">
      </a>
    </li>
    <li class="carousel__navigation-item">
    <a href="#carousel__slide${testimonies.length}" class="carousel__next">
      <img src="assets/next.svg" class="slider-icon" alt=">">
    </a>
    </li>
    `
  }
}

setTestimonies(carouselData)
