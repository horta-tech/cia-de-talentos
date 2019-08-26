import React, { Component } from 'react';
import Slider from "react-slick";

import axios from 'axios';

class SlickCaroulsel extends Component {
  constructor(props) {
    super(props);

    this.state = {
      staff: []
    }
  }

  componentDidMount() {
    const URL = 'api/v1/staff'
    axios.get(URL).then((res) => {
      if (res.status >= 200 && res.status <= 207) {
        this.setState({
          staff: res.data
        });
      } else {
        throw new Error(`HTTP status ${res.status}`);
      }
    });
  }

  render() {
    let settings = {
      dots: false,
      infinite: true,
      speed: 1000,
      autoplay: false,
      slidesToScroll: 0,
      swipeToSlide: true,
      mobileFirst: true,
      waitForAnimate: false
    };

    return (
      <Slider {...settings}>
        {this.state.staff.map((child) => {
          return (
          <div key={child.id} className="staff-card">
            <img src={child.image.url} className="staff-image" alt=""/>
            <div className="horta-border">
              <h6 className="m-0">{child.name} - {child.role}</h6>
            </div>
            <div>
              <p>{child.quote}</p>
            </div>
          </div>
          )
          })}
      </Slider>
    );
  }
}

export default SlickCaroulsel;
