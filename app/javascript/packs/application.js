require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import '../styles/application.scss'
import './clients/custom.js'

const feather = require('feather-icons')
document.addEventListener("turbolinks:load", () => {
  feather.replace();
});