import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
    static targets = [ "shortUrl" ]

	connect() {

	}

	async copyLink() {
        const shortUrlValue = this.shortUrlTarget.getAttribute('value')

        navigator.clipboard.writeText(shortUrlValue).then(() => {
            alert('Successfully copied the short url.')
        })
	}
}
