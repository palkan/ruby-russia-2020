/* global customElements */

import '../styles/shoelace.scss'

import { setAssetPath, SlDropdown, SlMenu, SlMenuItem } from '@shoelace-style/shoelace'

const rootUrl = document.currentScript.src.replace(/\/packs.*$/, '')

setAssetPath(rootUrl + '/packs/js/icons')
customElements.define('sl-dropdown', SlDropdown)
customElements.define('sl-menu', SlMenu)
customElements.define('sl-menu-item', SlMenuItem)
