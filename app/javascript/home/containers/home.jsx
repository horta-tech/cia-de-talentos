import React, { Component } from 'react';

import { Fade, Zoom, Roll } from 'react-reveal';
import axios from 'axios';

import CounterList from '../components/counterList';
import SlickCaroulsel from '../components/slickCaroulsel';
import HortaCard from '../components/hortaCard';
import HortaMap from '../components/map';


import HortaPlant from '../../../assets/images/horta-plant.jpg';
import Ilustra from '../../../assets/images/ilustra.png';

class Home extends Component {
  constructor(props) {
    super(props);

    this.state = {
    }
  }

  componentDidMount() {

  }

  async getStaff() {
    const URL = 'api/v1/staff'
    const staff = await axios.get(URL).then((res) => {
      if (res.status >= 200 && res.status <= 207) {
        return res.data;
        } else {
        throw new Error(`HTTP status ${res.status}`);
      }
    });
    return staff;
  }

  render() {
    console.log(this.state);

    return (
      <div>
        <div className="counter-list">
          <CounterList />
        </div>
        <div className="horta-intro">
          <p><span className="big-letter">N</span>ão gostamos de ficar na superfície:</p>
          <p className="text-horta">nosso amor pelo que desenvolvemos é de raiz.</p>
          <Fade>
            <img className="plant-img" src={HortaPlant} />
            <p><span className="big-letter">P</span>or isso fomos além do marketing digital, além da user experience. além do espaço físico, além da criação de conteúdo publicitário...</p>
            <p>Nossa <span className="big-text text-horta">CASA DE IDEIAS</span> funciona de maneira integrada e completa: <span className="text-horta"> são soluções 360º em TEMPO REAL.</span></p>
          </Fade>
        </div>

        <div className="horta-nav bg-horta text-center">
          <Fade>
            <h6 className="m-0">HortaLab | HortaTech | HortaProduções | HortaCasa</h6>
          </Fade>
        </div>
        <div className="horta-team mt-4 row">
          <div className="col-6">
            <div className="team-text">
                <h4 className="green-div">Horticultores</h4>
              <div className="container">
              <Fade>
                <p className="font-weight-light crew-text">Profissionais unidos em prol da criação de espaços de crescimento orgânico, visando a entrega de resultados frescos, saudáveis e duradouros no ambiente digital.</p>
              </Fade>
              </div>
            </div>
          </div>
          <div className="col-6">
            <Fade>
              <img className="team-img w-100" src={Ilustra} />
            </Fade>
          </div>
        </div>

        <SlickCaroulsel />

        <div className="hortas">
          <Zoom collapse>
            <HortaCard
              title="Hortalab"
              list={["SEO Full Service", "Criação & Direção de Arte", "Google, Facebook & Instagram Ads", "Branded Content", "CRM & E-mail Marketing", "Mídias de Performance"]}
            />
            <HortaCard
              title="HortaTech"
              list={["UX & UI", "Consultoria Tech", "Criação e Desenvolvimento de Sites", "Criação e Desenvolvimento de Apps", "Otimização SEO"]}
            />
            <HortaCard
              title="HortaProduções"
              list={["Vídeos Institucionais", "Conteúdo Web", "Animações", "Captação & Edição de vídeo", "Vídeo SEO"]}
            />
            <HortaCard
              title="HortaCasa"
              list={["Workshops e Palestras", "Coworking", "Reuniões", "Evento de médio porte"]}
            />
          </Zoom>
        </div>

        <div className="meet-text row  mt-4">
          <div className="col-6">
            <h5 className="green-div">Vem conhecer a Horta!</h5>
          </div>
          <div className="col-6">
            <p className="mr-2">Traga sua ideia, tome um café na Horta e leve seu pé de manjericão pra casa!</p>
          </div>
        </div>
        <Zoom>
          <HortaMap />
        </Zoom>

        <div className="horta-footer row">
          <div className="col-6">
            <Zoom collapse>
            <i className="fas fa-map-marker-alt horta-marker" className="d-block"></i>
            <h6>Rua Pedro Ortiz, 164</h6>
            <h5>Vila Madá-SP</h5>
            </Zoom>
          </div>
          <div className="col-6 m-auto">
            <Zoom collapse>
              <h5>Sigam me os bons</h5>
              <div className="d-flex social-media w-50">
                <div className="social-media-div">
                  <a href="https://www.facebook.com/concierge.hortalab.3">
                    <i className="fab fa-facebook-f"></i>
                  </a>
                </div>
                <div className="social-media-div">
                  <a href="https://www.instagram.com/horta.lab/">
                    <i className="fab fa-instagram"></i>
                  </a>
                </div>
                <div className="social-media-div">
                  <a href="https://www.linkedin.com/company/agenciahortalab/about/">
                    <i className="fab fa-linkedin-in"></i>
                  </a>
                </div>
              </div>
            </Zoom>
          </div>
        </div>

      </div>
    );
  }
}

export default Home;
