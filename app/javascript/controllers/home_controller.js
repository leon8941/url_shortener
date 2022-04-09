import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
	async copyLink(event) {
        const shortUrlValue = event.params.shortUrl

        navigator.clipboard.writeText(shortUrlValue).then(() => {
            alert(`Successfully copied the short url of ${shortUrlValue}.`)
        })
	}
}
