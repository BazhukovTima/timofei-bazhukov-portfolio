import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import Skills from "../Skills";

// Моковые данные для навыков в формате, который ожидает компонент
const mockSkills = {
  frontend: {
    title: "Frontend",
    skills: ["JavaScript", "React", "Advanced"],
  },
  backend: {
    title: "Backend",
    skills: ["Node.js"],
  },
};

describe("Skills", () => {
  it("renders all provided skills", () => {
    render(<Skills skills={mockSkills} />);
    expect(screen.getByText("JavaScript")).toBeInTheDocument();
    expect(screen.getByText("React")).toBeInTheDocument();
    expect(screen.getByText("Node.js")).toBeInTheDocument();
  });

  it("renders skill categories", () => {
    render(<Skills skills={mockSkills} />);
    expect(screen.getByText("Frontend")).toBeInTheDocument();
    expect(screen.getByText("Backend")).toBeInTheDocument();
  });

  it("renders nothing if skills object is empty", () => {
    const { container } = render(<Skills skills={{}} />);
    expect(container.firstChild).toBeNull();
  });

  it("renders nothing if skills is not provided", () => {
    const { container } = render(<Skills />);
    expect(container.firstChild).toBeNull();
  });
});
