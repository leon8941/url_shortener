import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
	static targets = [ "tagsList", "tagData", "tagInput" ]
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

	tagInputOnBlur(event) {
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

	generateTagsList() {
		this.tagsDataValue.forEach(function (tagData) {
			const tagList = document.createElement("li")
			const chip = this.generateChip(tagData)

			tagList.appendChild(chip)
			this.tagsListTargets[0].appendChild(tagList)
		}, this)
	}

	generateChip(textValue) {
		const span = document.createElement("span")
		const spanAttr = document.createAttribute("class")
		const dataTagsTargetAttr = document.createAttribute("data-tags-target")
		const dataTagsTagValueAttr = document.createAttribute("data-tags-tag-value")

		spanAttr.value = "badge"
		dataTagsTargetAttr.value = "tagData"
		dataTagsTagValueAttr.value = textValue

		span.setAttributeNode(spanAttr)
		span.setAttributeNode(dataTagsTargetAttr)
		span.setAttributeNode(dataTagsTagValueAttr)
		span.innerHTML = `${textValue} <a class="glyphicon glyphicon-remove" style="color: white" data-action="click->tags#tagDeleteOnClick" data-tags-text-value-param="${textValue}"></a>`
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
}