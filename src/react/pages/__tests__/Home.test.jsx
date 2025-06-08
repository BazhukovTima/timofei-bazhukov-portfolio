import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import Home from "../Home";

// Мокаем дочерние компоненты, чтобы изолировать тест
jest.mock("../../../assets/profile-no-bg.png", () => "profile.png");
jest.mock("../../components/home/SocialLinks", () => ({ social }) => (
  <div data-testid="mock-social-links">
    {JSON.stringify(social || {})}
  </div>
));
jest.mock("../../components/common/Footer", () => ({ fixed }) => (
  <footer data-testid="mock-footer">{fixed ? "fixed" : "not fixed"}</footer>
));

describe("Home component", () => {
  const mockInfo = {
    name: "John Doe",
    role: "Developer",
    description: "Experienced full-stack developer",
    location: "San Francisco",
    social: {
      twitter: "https://twitter.com/johndoe",
      linkedin: "https://linkedin.com/in/johndoe",
    },
  };

  it("renders correctly with full info", () => {
    render(<Home info={mockInfo} />);

    expect(screen.getByRole("heading", { level: 1 })).toHaveTextContent(
      mockInfo.name
    );
    expect(screen.getByText(mockInfo.role)).toBeInTheDocument();
    expect(screen.getAllByText(mockInfo.description)[0]).toBeInTheDocument();
    expect(screen.getAllByText(mockInfo.location)[0]).toBeInTheDocument();

    expect(screen.getByTestId("mock-social-links")).toHaveTextContent(
      JSON.stringify(mockInfo.social)
    );
    expect(screen.getByTestId("mock-footer")).toHaveTextContent("fixed");

    // Проверяем, что аватарка рендерится
    const avatarImg = screen.getByAltText("Avatar");
    expect(avatarImg).toBeInTheDocument();
    expect(avatarImg).toHaveAttribute("src", "profile.png");
  });

  it("renders null if info is not passed", () => {
    const { container } = render(<Home />);
    expect(container).toBeEmptyDOMElement();
  });

  it("renders null if info.name is missing", () => {
    const incompleteInfo = { ...mockInfo };
    delete incompleteInfo.name;
    const { container } = render(<Home info={incompleteInfo} />);
    expect(container).toBeEmptyDOMElement();
  });

  it("renders correctly even if some optional fields are missing", () => {
    const partialInfo = {
      name: "Jane Doe",
      role: undefined,
      description: undefined,
      location: undefined,
      social: undefined,
    };

    render(<Home info={partialInfo} />);

    expect(screen.getByRole("heading", { level: 1 })).toHaveTextContent(
      partialInfo.name
    );
    // Роль, описание, локация отсутствуют — проверяем, что элементы не рендерятся с текстом
    expect(screen.queryByText("undefined")).not.toBeInTheDocument();

    // Соцсети пустые — соцссылки все равно рендерятся, но пустые
    expect(screen.getByTestId("mock-social-links")).toHaveTextContent("{}");
  });
});
