export default class NavMenu extends window.sap.m.Bar {
  constructor() {
    super({
      contentLeft: [
        new window.sap.m.Button({
          text: "Home",
          press: () => this.navigate("/"),
        }),
        new window.sap.m.Button({
          text: "About",
          press: () => this.navigate("/about"),
        }),
        new window.sap.m.Button({
          text: "Experience",
          press: () => this.navigate("/experience"),
        }),
        new window.sap.m.Button({
          text: "Technologies",
          press: () => this.navigate("/tech"),
        }),
      ],
    });
  }

  navigate(path) {
    window.history.pushState({}, "", path);
    window.dispatchEvent(new Event("popstate"));
  }
}
