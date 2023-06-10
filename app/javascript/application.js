import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
import * as ActiveStorage from "@rails/activestorage"

ActiveStorage.start()

import $ from "jquery";
import 'bootstrap'
import 'popper.js'
import 'controllers'
