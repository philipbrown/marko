// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let Hooks = {}

Hooks.Tracking = {
  mounted() {
    this.setup()
    this.session_id = this.el.getAttribute("data-session-id")
    this.view = this.el.getAttribute("data-view")
    this.handleVisibilityChange = (e) => this.onVisibilityChange(e)
    document.addEventListener("visibilitychange", this.handleVisibilityChange)
  },
  destroyed() {
    document.removeEventListener(
      "visibilitychange",
      this.handleVisibilityChange
    )

    this.track()
  },
  setup() {
    this.start = performance.now()
  },
  onVisibilityChange(e) {
    if (document.visibilityState === "hidden") {
      this.track()
    } else {
      this.setup()
    }
  },
  track() {
    let body = {
      session_id: this.session_id,
      engagement_time: Math.round(performance.now() - this.start),
      view: this.view,
      browser_agent: navigator.userAgent,
    }

    let blob = new Blob([JSON.stringify(body)], {type: "application/json"})
    navigator.sendBeacon("/tracking", blob)

    this.start = null
  },
}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  hooks: Hooks,
  params: {_csrf_token: csrfToken}
})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", info => topbar.delayedShow(200))
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
