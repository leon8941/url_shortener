import { Controller } from '@hotwired/stimulus'

import { callDeleteUrl } from './api/url'

export default class extends Controller {
	async copyLink(event) {
        const shortUrlValue = event.params.shortUrl

        navigator.clipboard.writeText(shortUrlValue).then(() => {
            alert(`Successfully copied the short url of ${shortUrlValue}.`)
        })
	}

    async deleteUrl(event) {
        const {
            id,
        } = event.params

        const response = await callDeleteUrl(id)

        if (response.ok && (response.status >= 200 && response.status <= 299)) {
			location.reload()
		}
    }
}
