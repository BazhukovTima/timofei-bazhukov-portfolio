import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import About from "../About";

describe("About component", () => {
  const fullInfoMock = {
    about: {
      header: "About Me",
      expertise: { description: "Expertise description" },
      currentFocus: {
        header: "Current Focus",
        description: "Focus description",
      },
      technicalStack: {
        header: "Technical Stack",
        description: "Stack description",
      },
      mobileDevelopment: {
        header: "Mobile Development",
        description: "Mobile description",
      },
      softSkills: {
        header: "Soft Skills",
        description: "Soft skills description",
      },
    },
  };

  it("renders all sections with correct text", () => {
    render(<About info={fullInfoMock} />);
    expect(screen.getByRole("heading", { level: 2 })).toHaveTextContent(
      "About Me"
    );
    expect(screen.getByText("Expertise description")).toBeInTheDocument();
    expect(screen.getByText("Current Focus")).toBeInTheDocument();
    expect(screen.getByText("Focus description")).toBeInTheDocument();
    expect(screen.getByText("Technical Stack")).toBeInTheDocument();
    expect(screen.getByText("Stack description")).toBeInTheDocument();
    expect(screen.getByText("Mobile Development")).toBeInTheDocument();
    expect(screen.getByText("Mobile description")).toBeInTheDocument();
    expect(screen.getByText("Soft Skills")).toBeInTheDocument();
    expect(screen.getByText("Soft skills description")).toBeInTheDocument();
  });

  it("renders nothing if about data is missing", () => {
    const { container } = render(<About info={{}} />);
    expect(container.firstChild).toBeNull();
  });

  it("does not render blocks if some fields are missing", () => {
    const partialMock = {
      about: {
        header: "Partial About",
        expertise: {},
        currentFocus: { header: "Focus Only" }, // no description
        technicalStack: null,
        mobileDevelopment: { description: "Mobile Only description" }, // no header
      },
    };

    render(<About info={partialMock} />);

    expect(screen.getByRole("heading", { level: 2 })).toHaveTextContent(
      "Partial About"
    );
    expect(screen.queryByText("Expertise description")).not.toBeInTheDocument();

    // Both should NOT render due to missing fields
    expect(screen.queryByText("Focus Only")).not.toBeInTheDocument();
    expect(
      screen.queryByText("Mobile Only description")
    ).not.toBeInTheDocument();

    expect(screen.queryByText("Soft Skills")).not.toBeInTheDocument();
  });

  it("renders only available blocks", () => {
    const someMock = {
      about: {
        header: "Only Some",
        expertise: { description: "Only expertise" },
        currentFocus: { header: "Focus", description: "Focus desc" },
      },
    };
    render(<About info={someMock} />);
    expect(screen.getByRole("heading", { level: 2 })).toHaveTextContent(
      "Only Some"
    );
    expect(screen.getByText("Only expertise")).toBeInTheDocument();
    expect(screen.getByText("Focus")).toBeInTheDocument();
    expect(screen.getByText("Focus desc")).toBeInTheDocument();
    expect(screen.queryByText("Technical Stack")).not.toBeInTheDocument();
    expect(screen.queryByText("Mobile Development")).not.toBeInTheDocument();
    expect(screen.queryByText("Soft Skills")).not.toBeInTheDocument();
  });

  it("does not render main title if header is empty", () => {
    const noHeaderMock = {
      about: {
        header: "",
        expertise: { description: "desc" },
      },
    };
    render(<About info={noHeaderMock} />);
    expect(screen.queryByRole("heading", { level: 2 })).not.toBeInTheDocument();
    expect(screen.getByText("desc")).toBeInTheDocument();
  });
});
