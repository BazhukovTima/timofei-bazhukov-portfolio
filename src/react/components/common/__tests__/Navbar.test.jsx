import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
import "@testing-library/jest-dom";
import { MemoryRouter } from "react-router-dom";
import Navbar from "../Navbar";

// Helper to render Navbar with a given route
const renderWithRoute = (route = "/") =>
  render(
    <MemoryRouter initialEntries={[route]}>
      <Navbar />
    </MemoryRouter>
  );

describe("Navbar", () => {
  test("renders all navigation links", () => {
    renderWithRoute("/");

    const homeLinks = screen.getAllByText("Home");
    const aboutLinks = screen.getAllByText("About");
    const techLinks = screen.getAllByText("Technologies");
    const expLinks = screen.getAllByText("Experience");

    // Убеждаемся, что каждый линк отрисован хотя бы один раз
    expect(homeLinks.length).toBeGreaterThan(0);
    expect(aboutLinks.length).toBeGreaterThan(0);
    expect(techLinks.length).toBeGreaterThan(0);
    expect(expLinks.length).toBeGreaterThan(0);
  });

  test("menu toggle button toggles side menu", () => {
    renderWithRoute("/");
    const toggleBtn = screen.getByLabelText(/toggle menu/i);
    const sideMenu = screen.getByRole("navigation").nextSibling;

    expect(sideMenu).not.toHaveClass("open");

    fireEvent.click(toggleBtn);
    expect(sideMenu).toHaveClass("open");

    fireEvent.click(toggleBtn);
    expect(sideMenu).not.toHaveClass("open");
  });

  test("only highlights the active link", () => {
    renderWithRoute("/about");
    const aboutLink = screen.getAllByText("About")[0];
    const homeLink = screen.getAllByText("Home")[0];

    expect(aboutLink).toHaveClass("active");
    expect(homeLink).not.toHaveClass("active");
  });

  test("clicking outside the menu closes it", () => {
    renderWithRoute("/");
    const toggleBtn = screen.getByLabelText(/toggle menu/i);

    fireEvent.click(toggleBtn); // open
    const sideMenu = screen.getByRole("navigation").nextSibling;
    expect(sideMenu).toHaveClass("open");

    fireEvent.mouseDown(document.body); // click outside
    expect(sideMenu).not.toHaveClass("open");
  });
});
