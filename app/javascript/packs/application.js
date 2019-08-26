import "bootstrap";
import "slick-carousel";

$('.my-slick-carousel').slick({
  dots: true,
  infinite: true,
  autoplay: false,
  speed: 900,
  slidesToShow: 5,
  slidesToScroll: 5,
  responsive: [{
      breakpoint: 2560,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
  ]
});

$('.team-slick-carousel').slick({
  dots: true,
  infinite: true,
  autoplay: true,
  speed: 900,
  slidesToShow: 1,
  slidesToScroll: 1,
  responsive: [{
      breakpoint: 2560,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
  ]
});
