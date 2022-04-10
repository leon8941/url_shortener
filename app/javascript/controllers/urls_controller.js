import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
	static targets = [ "tagsList", "tagData", "tagInput", "form" ]
	static values = { tagsData: Array }

	connect() {

	}

	tagDeleteOnClick(event) {
		const filteredList = this.tagsDataValue.filter(function (tagData) {
			return event.params.textValue != tagData
		})

		this.tagsDataValue = [
			...filteredList
		]

		this.removeChildElements()
		this.generateTagsList()
	}

	executeTagInputProcess(event) {
		const eventValue = event.target.value

		if (!this.validateInput(eventValue)) {
			return
		} 

		this.tagsDataValue = [
			...this.tagsDataValue,
			eventValue
		]

		this.removeChildElements()
		this.generateTagsList()
		this.clearTagInput()
	}

	tagInputOnKeyPress(event) {
		if (event.key === 'Enter') {
			this.executeTagInputProcess(event)
		}
	}

	generateTagsList() {
		this.tagsDataValue.forEach(function (tagData) {
			const tagList = document.createElement("li")
			const chip = this.generateChip(tagData)
			const hidden = this.generateHiddenValue(tagData)

			tagList.appendChild(chip)
			tagList.appendChild(hidden)
			this.tagsListTargets[0].appendChild(tagList)
		}, this)
	}

	generateHiddenValue(textValue) {
		const input = document.createElement("input")
		input.type = "hidden"
		input.value = textValue
		input.name = `url[tags][]`

		return input
	}

	generateChip(textValue) {
		const span = document.createElement("span")
		const spanAttr = document.createAttribute("class")
		const dataTagsTargetAttr = document.createAttribute("data-urls-target")
		const dataTagsTagValueAttr = document.createAttribute("data-urls-tag-value")

		spanAttr.value = "badge"
		dataTagsTargetAttr.value = "tagData"
		dataTagsTagValueAttr.value = textValue

		span.setAttributeNode(spanAttr)
		span.setAttributeNode(dataTagsTargetAttr)
		span.setAttributeNode(dataTagsTagValueAttr)
		span.innerHTML = `${textValue} <a class="glyphicon glyphicon-remove" style="color: white" data-action="click->urls#tagDeleteOnClick" data-urls-text-value-param="${textValue}"></a>`
		return span
	}

	removeChildElements() {
		this.tagsListTargets[0].innerHTML = ''
	}

	validateInput(eventValue) {
		if (eventValue == '' || eventValue == null) {
			alert('This tag cannot be empty.')
			
			return false
		}

		if (this.tagsDataValue.includes(eventValue)) {
			this.clearTagInput()
			alert('This tag already exists.')
			
			return false
		}

		return true
	}

	clearTagInput() {
		if (this.hasTagInputTarget) {
			this.tagInputTargets[0].value = ''
		}
	}

	onSubmit(e) {
		e.preventDefault()
		this.formTarget.submit()
	}
}