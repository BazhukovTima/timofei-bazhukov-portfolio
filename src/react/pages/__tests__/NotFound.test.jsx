import React from "react";
import { render, screen } from "@testing-library/react";
import { MemoryRouter } from "react-router-dom";
import NotFound from "../NotFound";
import "@testing-library/jest-dom";

describe("NotFound component", () => {
  it("renders 404 heading", () => {
    render(
      <MemoryRouter>
        <NotFound />
      </MemoryRouter>
    );
    expect(screen.getByRole("heading", { level: 1 })).toHaveTextContent(
      "404 - Not found"
    );
  });

  it("renders link to home", () => {
    render(
      <MemoryRouter>
        <NotFound />
      </MemoryRouter>
    );
    const link = screen.getByRole("link", { name: /go home/i });
    expect(link).toBeInTheDocument();
    expect(link).toHaveAttribute("href", "/");
  });
});
