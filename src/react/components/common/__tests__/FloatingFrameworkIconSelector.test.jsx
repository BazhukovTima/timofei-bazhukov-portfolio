import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
import "@testing-library/jest-dom";
import FloatingFrameworkIconSelector from "../FloatingFrameworkIconSelector";
import { useFramework } from "../../../../frameworkContext";

// Моки — только после всех импортов
jest.mock("../../../../frameworkContext", () => ({
  useFramework: jest.fn(),
}));

jest.mock("../../../../assets/react-logo.png", () => "react.png");
jest.mock("../../../../assets/flutter-logo.png", () => "flutter.png");

jest.mock("../../../../data/info.json", () => ({
  frameworks: [
    { name: "React", logo: "react.png" },
    { name: "Flutter", logo: "flutter.png" },
    { name: "Unknown", logo: "" },
  ],
}));

const setFrameworkMock = jest.fn();

function setWindowWidth(width) {
  window.innerWidth = width;
  window.dispatchEvent(new Event("resize"));
}

describe("FloatingFrameworkIconSelector", () => {
  beforeEach(() => {
    setFrameworkMock.mockClear();
    useFramework.mockImplementation(() => ({
      framework: "React",
      setFramework: setFrameworkMock,
    }));
  });

  it("renders framework icons and selects a framework (positive)", () => {
    setWindowWidth(1024);
    render(<FloatingFrameworkIconSelector />);
    expect(screen.getByTitle("React")).toBeInTheDocument();
    expect(screen.getByTitle("Flutter")).toBeInTheDocument();
    fireEvent.click(screen.getByTitle("Flutter"));
    expect(setFrameworkMock).toHaveBeenCalledWith("Flutter");
  });

  it("shows placeholder for missing logo (negative)", () => {
    setWindowWidth(1024);
    render(<FloatingFrameworkIconSelector />);
    expect(screen.getAllByText("?")[0]).toBeInTheDocument();
  });

  it("toggle button appears on mobile and toggles expanded state (positive)", () => {
    setWindowWidth(500);
    render(<FloatingFrameworkIconSelector />);
    const toggleBtn = screen.getByLabelText("Toggle frameworks");
    expect(toggleBtn).toBeInTheDocument();
    fireEvent.click(toggleBtn);
    expect(screen.queryByTitle("React")).not.toBeInTheDocument();
  });
});
