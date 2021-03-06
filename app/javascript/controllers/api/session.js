import { getMetaValue } from '../helpers/'

export const callLogout = () => {
    return fetch('/logout', {
        method: 'DELETE',
        headers: {
            'X-CSRF-Token': getMetaValue('csrf-token')
        },
    })
}