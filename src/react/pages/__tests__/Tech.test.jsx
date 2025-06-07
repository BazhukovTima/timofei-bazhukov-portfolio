import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import Tech from "../Tech";

// Мокаем компонент Skills
jest.mock("../../components/tech/Skills", () => () => (
  <div data-testid="mock-skills" />
));

describe("Tech", () => {
  const baseInfo = {
    skills: {
      description: "Test skill description",
      skills: {
        frontend: {},
        backend: {},
      },
    },
  };

  it("renders section title", () => {
    render(<Tech info={baseInfo} />);
    expect(screen.getByText("Technologies and Frameworks")).toBeInTheDocument();
  });

  it("renders intro description from info", () => {
    render(<Tech info={baseInfo} />);
    expect(screen.getByText("Test skill description")).toBeInTheDocument();
  });

  it("does not render Skills if info.skills.skills is undefined", () => {
    const infoWithoutSkills = {
      skills: {
        description: "Only description",
        skills: undefined,
      },
    };
    render(<Tech info={infoWithoutSkills} />);
    expect(screen.queryByTestId("mock-skills")).not.toBeInTheDocument();
  });

  it("does not render description if it's missing", () => {
    const infoWithoutDescription = {
      skills: {
        skills: {
          frontend: {},
        },
      },
    };
    render(<Tech info={infoWithoutDescription} />);
    expect(screen.queryByText("Test skill description")).not.toBeInTheDocument();
  });

  it("renders main section and grid container when skills exist", () => {
    const { container } = render(<Tech info={baseInfo} />);
    expect(container.querySelector(".tech-section")).toBeInTheDocument();
    expect(container.querySelector(".tech-grid")).toBeInTheDocument();
  });

  it("returns null if both description and skills are missing", () => {
    const { container } = render(<Tech info={{ skills: {} }} />);
    expect(container.firstChild).toBeNull();
  });
});
