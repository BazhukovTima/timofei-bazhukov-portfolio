// components/sapui5/pages/HomePage.js
export default class ExperiencePage extends window.sap.m.Page {
  constructor() {
    super({
      title: "Experience",
      content: [
        new window.sap.m.Text({ text: "Это главная страница SAPUI5" }),
      ],
    });
  }
}
