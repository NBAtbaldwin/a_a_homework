import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>
        <NavLink exact to='/red' activeClassName="active" >Red</NavLink>
        <NavLink to='/green' activeClassName="active" >Green</NavLink>
        <NavLink exact to='/blue' activeClassName="active" >Blue</NavLink>
        <NavLink to='/violet' activeClassName="active" >Violet</NavLink>


        <div id="rainbow">
          <Route path="/red" component={Red} />
          <Route path="/green" component={Green} />
          <Route path="/blue" component={Blue} />
          <Route path="/violet" component={Violet} />
        </div>
      </div>
    );
  }
};

export default Rainbow;
