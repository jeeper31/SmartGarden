package smartgarden

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class LocationController {
    static scaffold = true
}
