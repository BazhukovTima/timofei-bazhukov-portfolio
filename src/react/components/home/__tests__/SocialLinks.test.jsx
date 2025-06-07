import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import SocialLinks from "../SocialLinks";

// Mock data
const social = [
  { platform: "LinkedIn", url: "https://linkedin.com", icon: "linkedin" },
  { platform: "GitHub", url: "https://github.com", icon: "github" },
];

describe("SocialLinks", () => {
  // Positive: Renders all provided social links
  it("renders all provided social links", () => {
    render(<SocialLinks social={social} />);
    expect(screen.getByLabelText(/LinkedIn/i)).toBeInTheDocument();
    expect(screen.getByLabelText(/GitHub/i)).toBeInTheDocument();
  });

  // Positive: Links have correct href attributes
  it("links have correct hrefs", () => {
    render(<SocialLinks social={social} />);
    expect(screen.getByLabelText(/LinkedIn/i).closest("a")).toHaveAttribute("href", "https://linkedin.com");
    expect(screen.getByLabelText(/GitHub/i).closest("a")).toHaveAttribute("href", "https://github.com");
  });

  // Negative: Does not render links for empty array
  it("renders nothing if social array is empty", () => {
    render(<SocialLinks social={[]} />);
    expect(screen.queryByRole("link")).not.toBeInTheDocument();
  });

  // Negative: Does not render links for missing platform property
  it("does not render link if platform is missing", () => {
    const incomplete = [{ url: "https://example.com", icon: "icon" }];
    render(<SocialLinks social={incomplete} />);
    expect(screen.queryByRole("link")).not.toBeInTheDocument();
  });
});
