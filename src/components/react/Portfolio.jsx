import React from "react";
import data from "../../data/info.json";
import Card from "./Card";
import CardContent from "./CardContent";
import Button from "./Button";

const Portfolio = () => (
  <section id="portfolio" className="section">
    <h2>Portfolio</h2>
    <div className="grid grid-3">
      {data.projects.map((project, i) => (
        <Card key={i}>
          <CardContent>
            <h3>{project.title}</h3>
            <p>{project.description}</p>
            <Button onClick={() => window.open(project.link, "_blank")}>Смотреть</Button>
          </CardContent>
        </Card>
      ))}
    </div>
  </section>
);

export default Portfolio;
