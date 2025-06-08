import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import Experience from "../Experience";

describe("Experience", () => {
  const mockInfo = {
    experience: {
      overview: "Overview text here.",
      projects: {
        "Project Alpha": {
          role: "Frontend Developer",
          company: "TechCorp",
          technologies: "React, TypeScript",
          details: "Developed UI components and integrated APIs.",
        },
        "Project Beta": {
          role: "Full Stack Developer",
          company: "DevSolutions",
          technologies: "Node.js, MongoDB",
          details: "Handled backend services and frontend logic.",
        },
      },
    },
  };

  it("renders the experience section title", () => {
    render(<Experience info={mockInfo} />);
    expect(screen.getByText("Experience")).toBeInTheDocument();
  });

  it("renders the overview text", () => {
    render(<Experience info={mockInfo} />);
    expect(screen.getByText("Overview text here.")).toBeInTheDocument();
  });

  it("renders all project cards with title, company, tech, and details", () => {
    render(<Experience info={mockInfo} />);

    expect(screen.getByText("Project Alpha — Frontend Developer")).toBeInTheDocument();
    expect(screen.getByText("TechCorp")).toBeInTheDocument();
    expect(screen.getByText("React, TypeScript")).toBeInTheDocument();
    expect(screen.getByText("Developed UI components and integrated APIs.")).toBeInTheDocument();

    expect(screen.getByText("Project Beta — Full Stack Developer")).toBeInTheDocument();
    expect(screen.getByText("DevSolutions")).toBeInTheDocument();
    expect(screen.getByText("Node.js, MongoDB")).toBeInTheDocument();
    expect(screen.getByText("Handled backend services and frontend logic.")).toBeInTheDocument();
  });

  it("does not render any projects if info.experience.projects is empty", () => {
    const emptyProjects = {
      experience: {
        overview: "Empty overview",
        projects: {},
      },
    };
    const { container } = render(<Experience info={emptyProjects} />);
    expect(container.querySelectorAll(".experience-item").length).toBe(0);
  });

  it("handles missing experience field gracefully", () => {
    const missingExperience = { experience: undefined };
    const { container } = render(<Experience info={missingExperience} />);
    // Should not crash or render content
    expect(container.firstChild).toBeNull();
  });
});
