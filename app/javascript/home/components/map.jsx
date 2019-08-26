import React, { Component } from 'react';
import GoogleMapReact from 'google-map-react';
import Logo from '../../../assets/images/c.png';
import Waze from '../../../assets/images/waze.png';
import Uber from '../../../assets/images/uber.png';


const Marker = ({ text }) => <div className="d-flex"><img className="horta-chat-icon" src={Logo} />{text}</div>;

class HortaMap extends Component {
  static defaultProps = {
    center: {
      lat: -23.548824,
      lng: -46.691256
    },
    zoom: 15
  };

  render() {
    return (
      <div>
        <a className="position-absolute map-icon" href="https://m.uber.com/ul/?action=setPickup&client_id=NiGGdOeVh4c1tXRrSqQ8ppYs_My-1VpN&pickup=my_location&dropoff[formatted_address]=Rua%20Pedro%20Ortiz%2C%20164%20-%20Pinheiros%2C%20S%C3%A3o%20Paulo%20-%20State%20of%20S%C3%A3o%20Paulo%2C%20Brazil&dropoff[latitude]=-23.549501&dropoff[longitude]=-46.691229">
          <img src={Uber}/>
        </a>
        <a className="position-absolute map-icon" href="https://www.waze.com/ul?ll=-23.54950140%2C-46.69122860&navigate=yes&zoom=16">
          <img src={Waze} id="waze"/>
        </a>
        <div style={{ height: '40vh', width: '100%' }}>
          <GoogleMapReact
            bootstrapURLKeys={{ key: "AIzaSyC-cGYF1LXsHAjLygQwDiqbOU3eTHob7CU" }}
            defaultCenter={this.props.center}
            defaultZoom={this.props.zoom}
          >
            <Marker
              lat={-23.548824}
              lng={-46.691256}
              text="Rua Pedro Ortiz, 164"
            />
          </GoogleMapReact>
        </div>
      </div>
    );
  }
}

export default HortaMap;
