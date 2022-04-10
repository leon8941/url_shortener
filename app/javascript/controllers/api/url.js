import { getMetaValue } from '../helpers/'

export const callDeleteUrl = (id) => {
    return fetch(`/urls/${id}`, {
        method: 'DELETE',
        headers: {
            'X-CSRF-Token': getMetaValue('csrf-token')
        },
    })
}