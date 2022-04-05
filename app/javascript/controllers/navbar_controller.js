import { Controller } from '@hotwired/stimulus'

import { callLogout } from './api/session'

export default class extends Controller {
	connect() {

	}

	async logout() {
		const response = await callLogout()

		if (response.ok && (response.status >= 200 && response.status <= 299)) {
			location.reload()
		}
	}
}
