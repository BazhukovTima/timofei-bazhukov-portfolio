import React from "react";
import { Switch, Route } from "react-router-dom";
import Navbar from "../react/components/common/Navbar";
import Home from "../react/pages/Home";
import About from "../react/pages/About";
import Experience from "../react/pages/Experience";
import Tech from "../react/pages/Tech";
import NotFound from "../react/pages/NotFound";
import info from "../data/info.json";

const ReactContainer = () => {

  return (
    <>
      <Navbar />
      <main>
        <Switch>
          <Route exact path="/" render={(props) => <Home {...props} info={info} />} />
          <Route path="/about" render={(props) => <About {...props} info={info} />} />
          <Route path="/tech" render={(props) => <Tech {...props} info={info} />} />
          <Route path="/experience" render={(props) => <Experience {...props} info={info} />} />
          <Route component={NotFound} />
        </Switch>
      </main>
    </>
  );
};

export default ReactContainer;
